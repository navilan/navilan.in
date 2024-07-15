{-# LANGUAGE OverloadedStrings #-}
module Hero
where


import           Clay
import qualified Clay.Media  as Mq
import           Data.Monoid ((<>))
import           Prelude     hiding (all, rem, span, (**))

import           Colors
import           Layout
import           Type


hero :: Css
hero = do
  ".navwrap" ? do
    sym2 margin (rem 0) auto
    flexAlignCenter
    ".rowwrap" ? do
      flexAlignCenter
    ".me" ? do
      maxWidth (px 710)
      forQ [Mq.maxWidth (px 710)] $ do
        maxWidth (pct 70)
      forQ [Mq.maxWidth (px 600)] $ do
        maxWidth (pct 80)
      forQ [Mq.maxWidth (px 400)] $ do
        maxWidth (pct 90)
      forQ [Mq.maxWidth (px 320)] $ do
        maxWidth (pct 95)
      sym margin (rem 0.618)
      img ? do
        height (rem 4)
        width (rem 4)
        "object-fit" -: "scale-down"
      ".links" ? do
        sym margin (rem 0.618)
      p ? do
        sym margin (rem 0.618)
        sansSerifFont
        lineHeight (rem 1)
        fontSize (rem 0.618)
