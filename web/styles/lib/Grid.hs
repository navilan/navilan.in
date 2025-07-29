{-# LANGUAGE OverloadedStrings #-}
module Grid
where


import           Clay
import qualified Clay.Flexbox as F
import           Data.Monoid  ((<>))
import           Gold
import           Layout


slammer :: Css
slammer = do
  goldenGrid
  ".grid" <> ".col" <> ".row" ? do
    display flex
    flexDirection column
    flexGrow 1
    flexShrink 1
    flexBasis auto
    justifyContent center
    ".fixed" ? do
      flexGrow 0
    ".centered" ? do
      flexAlignCenter
      textAlign center
    ".left" ? do
      flexAlignStart
    ".right" ? do
      flexAlignEnd
    ".around" ? do
      flexAlignCenter
      justifyContent spaceAround
    ".between" ? do
      flexAlignCenter
      justifyContent spaceBetween

  ".grid" <> ".row" ? do
    flexFlow row F.wrap

  ".row" ? do
    justifyContent flexStart

  ".stretch" ? do
    alignItems stretch
    alignContent stretch

  ".grid-gallery" ? do
    display grid
    "grid-template-columns" -: "1fr 1fr"
    "grid-template-rows" -: "1fr 1fr"
    "gap" -: "10px"
    margin (px 0) auto (px 0) auto

    "a" ? do
      display block
      overflow hidden
      "aspect-ratio" -: "1"
      maxWidth (px 200)
      maxHeight (px 200)

    "img" ? do
      width (pct 100)
      height (pct 100)
      "object-fit" -: "cover"
      display block

