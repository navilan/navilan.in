{-# LANGUAGE OverloadedLists   #-}
{-# LANGUAGE OverloadedStrings #-}

import           Clay
import qualified Clay.Media         as Mq
import           Data.Monoid        ((<>))
import qualified Data.Text.Lazy.IO  as Lazy
import           Prelude            hiding (all, rem, (**))
import           System.Environment (getArgs)


import           About
import           Button
import           Cards
import           Colors
import           Footer
import           Grid
import           Header
import           Hero
import           Layout
import           Reset
import           Social
import           Type
import           Writings


site :: Css
site = do

  html ? do
    fontSize (px 24)

  body ? do
    forQ [Mq.minDeviceWidth (px 320)] $ do
      fontSize (px 12)
    forQ [Mq.minDeviceHeight (px 600)] $ do
      fontSize (px 14)
    forQ [Mq.minDeviceHeight (px 900)] $ do
      fontSize (px 16)

    serifFont
    lineHeight (rem 1.1618)
    display flex
    flexDirection column
    minHeight (vh 100)


  h1 <> h2 <> h3 <> h4 <> h5 <> h6 ? do
    fontWeight bold
    sansSerifFont

  "em" <> strong ? do
    marginLeft (px 1)
    marginRight (px 1)


  ".container" ? do
    flexAlignStart
    flexGrow 1
    flexShrink 0
    flexBasis auto
    maxWidth (px 960)
    sym2 margin (rem 0.618) auto

    p ? do
      sym margin (rem 0.5)
      a ? do
        textDecoration underline

  ".txtcenter" ? do
    textAlign center
    flexAlignCenter
    p ? do
      textAlign center
      flexAlignCenter


  a ? do
    cursor pointer

  textarea ? do
    ".document" & do
      width (pct 100)
      height (pct 90)
      minHeight (px 600)
      overflow auto
      backgroundColor pWhite
      fontSize (rem 0.618)
      lineHeight (rem 1)
      borderTop (px 0) solid  transparent
      borderBottom (px 0) solid  transparent
      borderLeft (px 0) solid  transparent
      borderRight (px 0) solid  transparent
      sym padding (rem 0.618)
      sym margin (rem 1.618)


styleSheet :: Css
styleSheet = do
  reset
  slammer
  goldenType
  defaultFonts
  tableStyle
  buttonStyle
  site
  cardsStyle
  headerStyle
  footerStyle
  socialStyle
  hero
  about
  writings


main :: IO ()
main = do
  let out = renderWith compact [] styleSheet
  args <- getArgs
  case args of
    [file] -> do
      Lazy.writeFile file out
    _      -> do
      Lazy.putStr out
