{-# LANGUAGE OverloadedStrings #-}
module Reset
where


import           Clay
import           Colors
import           Data.Monoid ((<>))
import           Prelude     hiding (all, rem, (**))


reset :: Css
reset = do
  star ? do
    boxSizing borderBox
    before &
      boxSizing borderBox
    after &
      boxSizing borderBox

  html <> body ? do
    backgroundColor pWhite
    height (pct 100)
    width  (pct 100)
    sym margin (px 0)
    sym padding (px 0)

  body <> select <> input <> textarea ? do
    color pBlack
  star ? do
    sym margin (px 0)
    sym padding (px 0)
  a ? do
    color pHighDark
    hover & color pBlack
    textDecoration none
  selection & do
    background pGray
    color pWhite
  ins ? do
    backgroundColor pGray
    color pWhite
    textDecoration none
  mark ? do
    backgroundColor pHighDark
    color pHighLight
    fontStyle italic
    fontWeight bold
  (input <> textarea) ?
    placeholder &
      color pGray
  blockquote ? do
    sym padding (rem 1)
    backgroundColor pWhite
  img ?
    verticalAlign vAlignBottom
