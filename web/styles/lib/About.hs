{-# LANGUAGE OverloadedStrings #-}
module About
where


import           Clay
import qualified Clay.Media  as Mq
import           Data.Monoid ((<>))

import           Colors
import           Layout
import           Prelude     hiding (all, rem, (**))


about :: Css
about = do
  ".me" ? do
    ".col" ? do
      sym2 padding (rem 1.618) (rem 0)
    ".content-col" ? do
      flexAlignStart
      textAlign (alignSide sideLeft)
      forQ [Mq.maxWidth (px 600)] $ do
        width (pct 100)
        sym2 padding (rem 0.5618) (rem 0)
        marginBottom (rem 0.1618)
        star ? do
          fontSize (rem 0.618)
        p ? do
          sym2 margin (rem (0.618/2)) (rem 0)
    ".profile-col" ? do
      flexAlignCenter
      img ? do
        flexAlignCenter
        width (px 200)
        height (px 200)
        flexGrow 0
        flexShrink 0
