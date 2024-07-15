{-# LANGUAGE ApplicativeDo     #-}
{-# LANGUAGE DeriveFoldable    #-}
{-# LANGUAGE DeriveFunctor     #-}
{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE DeriveTraversable #-}
{-# LANGUAGE LambdaCase        #-}
{-# LANGUAGE OverloadedStrings #-}

module Site.Types where

import qualified Data.Text              as T
import qualified Text.Pandoc.Definition as P

data ExternalVideoSource = YouTube
data ExternalAudioSource = SoundCloud url
data ExternalMediaSource = ExternalVideoSource | ExternalAudioSource

type Year = Integer
data Month = JAN | FEB | MAR | APR | MAY | JUN
           | JUL | AUG | SEP | OCT | NOV | DEC
  deriving (Show, Eq, Ord, Enum)

showMonth :: Month -> String
showMonth = \case
              JAN -> "January"
              FEB -> "February"
              MAR -> "March"
              APR -> "April"
              MAY -> "May"
              JUN -> "June"
              JUL -> "July"
              AUG -> "August"
              SEP -> "September"
              OCT -> "October"
              NOV -> "November"
              DEC -> "December"

data PageData = PD
    { pageDataTitle     :: !(Maybe T.Text)
    , pageDataDesc      :: !(Maybe T.Text)
    , pageDataImage     :: !(Maybe FilePath)
    , pageDataType      :: !(Maybe T.Text)
    , pageDataCanonical :: !(Maybe FilePath)
    , pageDataCss       :: ![T.Text]
    , pageDataJs        :: ![T.Text]
    , pageDataHeaders   :: ![H.Html]
    }

instance Default PageData where
    def = PD { pageDataTitle     = Nothing
             , pageDataDesc      = Nothing
             , pageDataImage     = Nothing
             , pageDataType      = Nothing
             , pageDataCanonical = Nothing
             , pageDataCss       = []
             , pageDataJs        = []
             , pageDataHeaders   = []
             }

mInt :: Month -> Int
mInt = (+ 1) . fromEnum

data PostType = Essay | Poetry | Story
  deriving (Show, Eq, Ord, Enum)


data PostLanguage = English | Tamil
  deriving (Show, Eq, Ord, Enum)

data Post = Post
  { postTitle      :: !T.Text
  , postContents   :: !P.Pandoc
  , postHighlight  :: !P.Pandoc
  , postSourceFile :: !FilePath
  , postHeroImage  :: !FilePath
  , postCreated    :: !(Maybe LocalTime)
  , postPublished  :: !(Maybe LocalTime)
  , postUpdated    :: !(Maybe LocalTime)
  , postIdentifier :: !(Maybe T.Text)
  , postSequence   :: !(Maybe Int)
  , postSlug       :: !(Maybe T.Text)
  , postOldSlugs   :: ![T.Text]
  , postCanonical  :: !FilePath
  , postTags       :: ![(TagType, T.Text)]
  , postTweetId    :: !(Maybe T.Text)
  , postType       :: PostType
  , postLanguage   :: PostLanguage
  }
  deriving (Show, Generic, Typeable, Eq)

instance B.Binary Post

data Tag = Tag
    { tagLabel       :: !T.Text
    , tagDescription :: !(Maybe T.Text)
    , tagEntries     :: ![Entry]
    }
  deriving (Show, Generic, Typeable)

instance B.Binary Tag

data Grouping g a = Grouping (M.Map g [a])
                  | q


data ArchiveData a = ADAll               (M.Map Year (M.Map Month (M.Map LocalTime [a])))
                   | ADYear   Year       (M.Map Month (M.Map LocalTime [a]))
                   | ADMonth  Year Month (M.Map LocalTime [a])
                   | ADTagged Tag        [a]
  deriving (Show, Foldable, Traversable, Functor)

instance B.Binary P.Pandoc
instance B.Binary P.Meta
instance B.Binary P.Block
instance B.Binary P.MetaValue
instance B.Binary P.Inline
instance B.Binary P.Format
instance B.Binary P.ListNumberStyle
instance B.Binary P.QuoteType
instance B.Binary P.ListNumberDelim
instance B.Binary P.Alignment
instance B.Binary P.Citation
instance B.Binary P.MathType
instance B.Binary P.CitationMode
