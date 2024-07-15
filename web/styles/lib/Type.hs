{-# LANGUAGE OverloadedStrings #-}
module Type
where


import           Clay
import qualified Clay.Media    as Mq
import           Control.Monad (zipWithM_)
import qualified Data.List     as L
import           Data.Monoid   ((<>))
import qualified Data.Text     as T
import           Prelude       hiding (all, rem, (**))


import           Colors
import           Gold
import           Layout


typeGld :: Double
typeGld = 1.23

serifFont :: Css
serifFont = fontFamily ["Merriweather"] [serif]

sansSerifFont :: Css
sansSerifFont = fontFamily ["Montserrat Alternates"] [sansSerif]

tam1Font :: Css
tam1Font = fontFamily ["Arima Madurai", "Montserrat Alternates"] [sansSerif]

tam2Font :: Css
tam2Font = fontFamily ["Arima Madurai", "Merriweather"] [serif]

viewPortHeight :: Double
viewPortHeight = typeGld * (typeGld - 1)

typescale :: [Double]
typescale =
  addl heads
  where
    typescale' = take 5 . drop 1 $ golds' typeGld
    heads      = L.reverse . fmap  ((* viewPortHeight) . snd) $ typescale'
    addl [] = []
    addl l  = l ++ [last l]


goldenFontSize :: Double -> Double -> Double -> Css
goldenFontSize sz minn maxx = do
  fontSize (vmin sz)
  query all [Mq.maxHeight (px minBreak)] $ do
    fontSize (px minn)

  query all [Mq.maxWidth (px minBreak)] $ do
    fontSize (px minn)

  query all [Mq.maxWidth (px minBreak), Mq.maxHeight (px minBreak)] $ do
    fontSize (px minn)

  query all [Mq.maxWidth (px maxBreak), Mq.maxHeight (px maxBreak)] $ do
    fontSize (px maxx)

  where
    minBreak = minn / sz * 100.0
    maxBreak = maxx / sz * 100.0


goldenType :: Css
goldenType = do
  zipWithM_ makeH [1..] scaleMinMaxes
  p <> li <> dt <> dd <> table <> form ? do
    head5 scaleMinMaxes
  where
    el num   = element . T.pack $ ("h" ++ show num)
    makeH :: Integer -> (Double, Double, Double) -> Css
    makeH num (sz, minn, maxx) = el num ? goldenFontSize sz minn maxx
    minMaxes = [ (28, 30)
               , (24, 26)
               , (18, 20)
               , (16, 18)
               , (14, 16)
               , (12, 14)
               ]
    mkTriple sz (minn, maxx) = (sz, minn, maxx)
    scaleMinMaxes = zipWith mkTriple typescale minMaxes
    head5 scales | length scales > 4 = let (sz, minn, maxx) = scales !! 4 in
                                         goldenFontSize sz minn maxx
                 | otherwise         = goldenFontSize typeGld 12 16


quotation :: Css
quotation = do
  ".quotation" ? do
    position relative
    sansSerifFont
    color pWhite
    backgroundColor pGray
    fontSize (rem 1)
    p <> a ? do
      textAlign center
      flexAlignCenter
    a ? do
      color pWhite


defaultFonts :: Css
defaultFonts = do
  ":lang(ta)" ? do
      tam1Font
      fontWeight (weight 500)
  ".tamil" ? do
    tam1Font
    fontWeight (weight 500)
  ".big-tamil" ? do
    tam2Font
    fontWeight (weight 500)
