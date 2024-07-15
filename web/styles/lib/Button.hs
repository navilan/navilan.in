{-# LANGUAGE OverloadedLists   #-}
{-# LANGUAGE OverloadedStrings #-}
module Button
where

import           Clay
import qualified Clay.Media  as Mq
import           Data.Monoid ((<>))
import           Prelude     hiding (all, rem, (**))


import           Colors
import           Layout
import           Type


buttonStyle :: Css
buttonStyle = do

  ".bottombar" ? do
    marginTop (rem 1.618)
    sym padding (rem 1.0)


    ".section-wrap" ? do
      flexAlignStart
      justifyContent spaceBetween


  ".button-wrap" <> ".button-row" ? do
    flexGrow 0
    flexAlignCenter

    ".left" & do
      flexAlignStart


    ".right" & do
      flexAlignEnd


  ".button" ? do
    sansSerifFont
    fontWeight bold
    backgroundColor pHighLight
    color pHighDark
    textAlign center
    textDecoration none
    cursor pointer
    boxShadow [bsColor pGray $ shadowWithBlur (px 1) (px 3) (rem 0.1618)]
    sym2 padding (rem 0.1618) (rem 0.1618)
    sym borderRadius (rem 0.1618)
    sym padding (rem 0.618)
    minWidth (rem 4)
    maxWidth (pct 44)
    forQ [Mq.maxWidth (px 600)] $ do
      maxWidth (pct 80)
    sym margin (rem 0.618)
    flexAlignCenter

    star ? do
      flexAlignCenter
    hover & do
      color pBlack


    ".link" & do
      backgroundColor transparent
      boxShadow [bsColor transparent $ shadowWithBlur (px 0) (px 0) (px 0)]
      sym borderRadius (rem 0)
      color pHighDark
      hover & do
        color pHighLight

    ".primary" & do
      backgroundColor pHighDark
      color pWhite

      hover & do
        color pHighLight
