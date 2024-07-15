{-# LANGUAGE OverloadedStrings #-}
module Header
where

import           Clay
import qualified Clay.Media  as Mq
import           Data.Monoid ((<>))
import           Data.Text   (pack)
import           Prelude     hiding (all, rem, (**))


import           Colors
import           Layout
import           Type


headerStyle :: Css
headerStyle = do
  ".header-wrap" ? do
    backgroundColor pHighDark
    color pWhite
    flexAlignStart
    height (px 340)
    flexGrow 0
    flexShrink 0
    flexBasis auto
  ".nav-wrap" ? do
    sansSerifFont
    nav ? do
      backgroundColor pBlack
      ".menu" ? do
        flexAlignCenter
        flexGrow 0
        flexShrink 0
        flexBasis auto
      li ? do
        lineHeight (rem 1.618)
        flexGrow 0
        flexShrink 0
        flexBasis auto
        flexAlignCenter
        minWidth (px 100)
        sym padding (rem 0.1618)
        borderTop solid (px 4) pHighDark
        marginTop (px (-8))
        a ? do
          flexAlignCenter
          color pHighLight
          hover & do
            color pWhite
        ".active" & do
          borderTop solid (px 4) pWhite
          backgroundColor pWhite
          marginTop (px 0)
          a ? do
            color pBlack
      ".no-bg" & do
        backgroundColor pHighDark
        li ? do
          a ? do
            backgroundColor transparent
            color pHighLight
          ".active" & do
            backgroundColor transparent
            a ? do
              color pWhite
      ".right" & do
        flexAlignEnd
        ul ? do
          flexAlignEnd
        li ? do
          flexAlignEnd


  ".logo-wrap" ? do
    sym2 padding (rem 0.618) (rem 0)
  ".page-header" ? do
    flexAlignCenter
    svg ? do
      flexAlignCenter
      maxWidth (rem 6)
      ".a" ? do
        "fill" -: (toHex pWhite)
      ".b" <> ".c" ? do
        "stroke" -: (toHex pBlack)
      ".d" ? do
        "fill" -: (toHex pHighDark)


    h1 ? do
      lineHeight (rem 2)
      color pWhite
      fontSize (rem 1.1618)
      fontWeight bolder
    h2 ? do
      lineHeight (rem 1.1618)
      fontSize (rem 0.8)
      fontWeight lighter
