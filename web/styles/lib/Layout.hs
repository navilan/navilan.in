{-# LANGUAGE OverloadedStrings #-}
module Layout
where



import           Clay
import qualified Clay.Media      as Mq
import           Clay.Stylesheet (Feature)
import           Data.Maybe      (fromMaybe)
import           Data.Monoid     ((<>))
import qualified Data.Text       as T
import           Prelude         hiding (all, rem, (**))
import           System.FilePath (splitExtension, (<.>))
import           Text.Printf

import           Colors


flexAlign :: AlignContentValue -> AlignItemsValue -> JustifyContentValue -> Css
flexAlign x y z = do
  alignContent x
  alignItems y
  justifyContent z


flexAlignStart :: Css
flexAlignStart = flexAlign flexStart flexStart flexStart


flexAlignEnd :: Css
flexAlignEnd = flexAlign flexEnd flexEnd flexEnd


flexAlignCenter :: Css
flexAlignCenter = flexAlign center center center


dpiA1, dpiA2, dpiA3 :: [Feature]
dpiA3 = [Mq.minResolution (Mq.dpi 3)]
dpiA2 = [Mq.minResolution (Mq.dpi 2), Mq.maxResolution (Mq.dpi 3)]
dpiA1 = [Mq.minResolution (Mq.dpi 1), Mq.maxResolution (Mq.dpi 2)]


forDpi1, forDpi2, forDpi3 :: [Feature] -> Css -> Css
forDpi3 fs = query all (dpiA3 ++ fs)
forDpi2 fs = query all (dpiA2 ++ fs)
forDpi1 fs = query all (dpiA1 ++ fs)

forQ :: [Feature] -> Css -> Css
forQ features = query all features


portrait :: [Feature]
portrait = [Mq.maxDeviceWidth (px 700)]


landscape :: [Feature]
landscape = [Mq.minDeviceWidth (px 700)]


forPortrait :: [Feature] -> Css -> Css
forPortrait features = forQ (features ++ portrait)


forLandscape :: [Feature] -> Css -> Css
forLandscape features = forQ (features ++ landscape)


responsiveImageName :: FilePath -> Double -> FilePath
responsiveImageName path sratio = suffixed <.> ext
  where
    (fname, ext) = splitExtension path
    strip t t'   = fromMaybe t' (T.stripSuffix t t')
    suffix s'    = T.unpack . strip "." . strip "0" . strip "0" . T.pack $ printf "%.2f" s'
    suffixed     = fname ++ norm (suffix sratio)
    norm []      = []
    norm "1"     = []
    norm s'      = "@" ++ ( T.unpack
                          . T.replace "." ","
                          . T.pack $ s'
                          )
                       ++ "x"


responsiveImage :: FilePath -> Double -> Double -> Css
responsiveImage path w h = do
  forQ [Mq.minDeviceWidth (px . fromInteger . ceiling $ w * 3.0)] $ rImg 3
  forQ [Mq.minDeviceWidth (px . fromInteger . ceiling $ w * 2.0)] $ rImg 2
  forQ [Mq.minDeviceWidth (px . fromInteger . ceiling $ w * 1.5)] $ rImg 1.5
  forQ [Mq.minDeviceWidth (px w)] $ rImg 1
  forQ [Mq.minDeviceWidth (px . fromInteger . ceiling $ w * 3.0 / 4.0)] $ rImg 0.75
  forQ [Mq.minDeviceWidth (px . fromInteger . ceiling $ w / 2.0)] $ rImg 0.5
  forQ [Mq.minDeviceWidth (px . fromInteger . ceiling $ w / 3.0)] $ rImg 0.33
  forQ [Mq.minDeviceWidth (px . fromInteger . ceiling $ w / 4.0)] $ rImg 0.25
  where
    rImg s' = do
      backgroundImage (url . T.pack $ responsiveImageName path s')
      width . px . fromInteger . ceiling $ s' * w
      height . px . fromInteger . ceiling $ s' * h


tableStyle :: Css
tableStyle =
  table <> ".divTable" ? do
    width (pct 100)
    borderCollapse collapse
    fontSize (rem 0.618)
    tr <> ".divTableRow" ? do
      td <> th <> ".divTableCell" <> ".divTableHead" ? do
        border solid (px 1) pGray
        sym2 padding (rem 0.618) (rem 0)
        textAlign center
        width (pct 13)
        ".wide" & do
          width (pct 24)
    thead <> ".divTableHead" ? do
      backgroundColor pBlack
      color pWhite
      fontWeight normal
      th ? do
        fontWeight normal
    tbody <> ".divTableBody" ? do
      fontSize (rem 0.618)
    ".divTable" ? do
      display displayTable
    ".divTableRow" ? do
      display tableRow
    ".divTableHeading" ? do
      display tableHeaderGroup
    ".divTableCell" <> ".divTableHead" ? do
      display tableCell
    ".divTableFoot" ? do
      display tableFooterGroup
    ".divTableBody" ? do
      display tableRowGroup
