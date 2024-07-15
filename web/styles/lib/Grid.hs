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

