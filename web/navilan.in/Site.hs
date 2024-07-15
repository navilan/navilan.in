--------------------------------------------------------------------------------
{-# LANGUAGE OverloadedStrings #-}

import           Data.Functor.Identity (runIdentity)
import           Data.List             (isInfixOf)
import           Data.List.Utils       (replace)
import           Data.Monoid           ((<>))
import           Data.Text             (Text)
import qualified Data.Text as T
import           Hakyll
import           System.FilePath.Posix
    ( makeRelative
    , splitDirectories
    , takeBaseName
    , takeDirectory
    , takeFileName
    , (</>)
    )
import Text.Pandoc.Options
  ( WriterOptions
  , writerNumberSections
  , writerSyntaxMap
  , writerTOCDepth
  , writerTableOfContents
  , writerTemplate
  )

import qualified Text.Pandoc.Templates as PT


--------------------------------------------------------------------------------
main :: IO ()
main = hakyll $ do

    match "snippets/**/*.md" $
      compile pandocTemplateCompiler

    match "templates/*" $
      compile templateBodyCompiler

    match "templates/**/*" $
      compile templateBodyCompiler

    match "faves/**" $ do
        route   rootRoute
        compile copyFileCompiler

    match "media/images/**" $ do
        route   idRoute
        compile copyFileCompiler

    match "media/styles/*.css" $ do
        route   idRoute
        compile copyFileCompiler

    match "sitemap.xml" $ do
        route   idRoute
        compile copyFileCompiler

    match "robots.txt" $ do
        route   idRoute
        compile copyFileCompiler

    match ("site/**/writings/**/*.jpg" .||. "site/**/writings/**/*.png" .||. "site/**/writings/**/*.svg") $ do
        route   (writingsRoute False)
        compile copyFileCompiler

    match "site/en/writings/**/*.md" $ do
      let ctx = writingsCtx enCtx
      route (writingsRoute True)
      compile $ do getResourceString
          >>= applyAsTemplate ctx
          >>= renderPandoc
          >>= saveSnapshot "content"
          >>= return . fmap demoteHeaders
          >>= loadAndApplyTemplate "templates/writing.html" ctx
          >>= loadAndApplyTemplate "templates/header.html" ctx
          >>= loadAndApplyTemplate "templates/footer.html" ctx
          >>= loadAndApplyTemplate "templates/base.html" ctx
          >>= relativizeUrls

    match "site/en/writings/**/*.md" $ version "toc" $ do
      compile pandocToc

    match "site/index.html" $ do
      let ctx = enCtx
      route cleanRoute
      compile $ do getResourceString
          >>= applyAsTemplate ctx
          >>= renderPandoc
          >>= loadAndApplyTemplate "templates/header.html" ctx
          >>= loadAndApplyTemplate "templates/footer.html" ctx
          >>= loadAndApplyTemplate "templates/base.html" ctx
          >>= relativizeUrls

    match "site/ta/writings/**/*.md" $ do
      let ctx = writingsCtx taCtx
      route (writingsRoute True)
      compile $ do getResourceString
          >>= applyAsTemplate ctx
          >>= renderPandoc
          >>= saveSnapshot "content"
          >>= return . fmap demoteHeaders
          >>= loadAndApplyTemplate "templates/writing.html" ctx
          >>= loadAndApplyTemplate "templates/header.html" ctx
          >>= loadAndApplyTemplate "templates/footer.html" ctx
          >>= loadAndApplyTemplate "templates/base.html" ctx
          >>= relativizeUrls

    create ["en/writings/index.html"] $ do
      let ctx = (constField "container-class" "writing-list-container") <> writingsCtx enCtx
      makeArchive "site/en/writings/**/*.md" ctx "Writings"

    create ["ta/writings/index.html"] $ do
      let ctx = (constField "container-class" "writing-list-container") <> writingsCtx taCtx
      makeArchive "site/ta/writings/**/*.md" ctx "எழுத்து"

    processLanguage "en" enCtx
    processLanguage "ta" taCtx

  where
    pandocTemplateCompiler :: Compiler (Item Template)
    pandocTemplateCompiler = fmap (fmap readTemplate) pandocCompiler


    processLanguage lang ctx = do
      match (fromGlob ("site/" ++ lang ++ "/**/*.html") .||. fromGlob ("site/" ++ lang ++ "/*.html")) $ do
        route cleanRoute
        compile $ do
          getResourceBody
            >>= applyAsTemplate ctx
            >>= loadAndApplyTemplate "templates/header.html" ctx
            >>= loadAndApplyTemplate "templates/footer.html" ctx
            >>= loadAndApplyTemplate "templates/base.html" ctx
            >>= relativizeUrls

    writings lang ctx path archivePath = buildPaginateWith
      (\ids -> sortRecentFirst ids >>= return . paginateEvery 20)
      path
      (\n -> if n == 1
          then archivePath
          else fromCapture "site/*/writings/**/*.html" (show n))


    makeArchive pattern pCtx title = do
      route cleanRoute
      compile $ do
        items <- loadAllSnapshots (pattern .&&. hasNoVersion) "content"
        let ctx  = constField "title" title
                <> listField  "posts" pCtx (return items)
                <> pCtx
        makeItem ""
          >>= loadAndApplyTemplate "templates/list.html" ctx
          >>= loadAndApplyTemplate "templates/header.html" ctx
          >>= loadAndApplyTemplate "templates/footer.html" ctx
          >>= loadAndApplyTemplate "templates/base.html" ctx
          >>= relativizeUrls

--------------------------------------------------------------------------------

relToAbs :: Context a
relToAbs =
  functionField "relToAbs" $ \args item -> return $
    case args of
      [path] -> (makeRelative "site" . takeDirectory . toFilePath $ itemIdentifier item) </> path
      _      -> ""


langUrl :: String -> String -> String
langUrl lang url = replace "#lang#" lang url


langUrlField :: Context a
langUrlField = functionField "langUrl" $ \args item ->
  case args of
    [lang, url] -> return $ langUrl lang url
    _           -> fail "Not enough arguments"


pageType :: String -> FilePath -> Context a
pageType s p = boolField s $ isInfixOf p . toFilePath . itemIdentifier

baseCtx :: Context String
baseCtx =
     dateField "date" "%B %e, %Y"
  <> langUrlField
  <> metadataField
  <> relToAbs
  <> defaultContext


tocField :: Context a
tocField = field "toc" $ \item ->
  loadBody ((itemIdentifier item) { identifierVersion = Just "toc" })

enCtx :: Context String
enCtx = baseCtx
     <> constField "lang-en" "true"
     <> constField "lang" "en"
     <> constField "lang-site-name"  "navilan"
     <> constField "lang-site-title" "reasonably unfiltered"
     <> constField "lang-about-name"  "about"
     <> constField "lang-writings-name" "writings"
     <> constField "lang-read-more" "Read"
     <> tocField


taCtx :: Context String
taCtx = baseCtx
     <> constField "lang-ta" "true"
     <> constField "lang" "ta"
     <> constField "lang-site-name"  "நவிலன்"
     <> constField "lang-site-title" "எண்ணக்கூவல்"
     <> constField "lang-about-name"  "இவன்"
     <> constField "lang-writings-name" "எழுத்து"
     <> constField "lang-read-more" "திற"


writingsCtx :: Context String -> Context String
writingsCtx ctx = ctx
               <> constField "page_writings" "true"
               <> constField "container-class" "writing-container"
               <> teaserField "teaser" "content" <> defaultContext

------------------------------------------------------------------------

tocTemplate :: PT.Template Text
tocTemplate = case runIdentity $ PT.compileTemplate "" tmpl of
  Left err -> error err
  Right template -> template
  where
    tmpl = T.intercalate
      "\n"
      [ ""
      , "<div class=\"toc\"><div class=\"header\">Contents</div>"
      , "$toc$"
      , "</div>"
      ]




onlyTOC :: WriterOptions
onlyTOC = defaultHakyllWriterOptions
        { writerTableOfContents = True
        , writerNumberSections  = True
        , writerTOCDepth        = 3
        , writerTemplate        = Just tocTemplate
        }


pandocToc :: Compiler (Item String)
pandocToc = do
  under <- getUnderlying
  toc <- getMetadataField under "addToc"
  let options = maybe defaultHakyllWriterOptions (const onlyTOC) toc
  pandocCompilerWith defaultHakyllReaderOptions options

rootRoute :: Routes
rootRoute = customRoute root
  where
    p  i       = toFilePath i
    root ident = makeRelative (head $ splitDirectories (p ident)) (p ident)


writingsRoute :: Bool -> Routes
writingsRoute asHtml = customRoute createRoute
  where
    createRoute ident  =
      nosite $ takeDirectory p </> fileName
      where
        p        = toFilePath ident
        nosite   = makeRelative "site"
        fileName = if asHtml then ((takeBaseName p) ++ ".html") else (takeFileName p)

cleanRoute :: Routes
cleanRoute = customRoute createIndexRoute
  where
    createIndexRoute ident  =
      nosite $ takeDirectory p </> index
      where
        p        = toFilePath ident
        nosite   = makeRelative "site"
        fname    = takeFileName p
        index    = case fname of
          "index.html" -> fname
          _            -> takeBaseName p </> "index.html"
