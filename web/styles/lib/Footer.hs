{-# LANGUAGE OverloadedStrings #-}
module Footer
where

import           Clay
import qualified Clay.Media  as Mq
import           Data.Monoid ((<>))
import           Data.Text   (pack)
import           Prelude     hiding (all, rem, (**))


import           Colors
import           Layout
import           Type


footerStyle :: Css
footerStyle = do
  footer ? do
    ".site-footer" & do
      display flex
      backgroundColor pHighDark
      flexGrow 0
      flexShrink 0
      flexBasis auto
    ".cc" ? do
      paddingBottom (rem 1.1618)
      color pGray
      lineHeight (rem 1.618)
      ".cc-image" ? do
        sym margin (rem 0.1618)
      a ? do
        marginLeft (px 4)
        color pGray
        textDecoration underline
