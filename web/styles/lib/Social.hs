{-# LANGUAGE OverloadedStrings #-}
module Social
where

import           Clay
import           Data.Monoid ((<>))
import           Prelude     hiding (all, rem, span, (**))


import           Colors
import           Layout



socialStyle :: Css
socialStyle = do
  ".social" ? do
    sym padding (rem 1.1618)
    flexAlignCenter
    ".fclist" ? do
      maxWidth (rem 12)
      li <> a <> img <> svg ? do
        flexAlignCenter
      svg ? do
        height (rem 1.1618)
        width (rem 1.1618)
        "fill" -: (toHex pHighLight)
        hover & do
          "fill" -: (toHex pWhite)
