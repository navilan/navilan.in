{-# LANGUAGE OverloadedStrings #-}
module Writings
where


import           Clay
import qualified Clay.Media  as Mq
import           Data.Monoid ((<>))
import           Prelude     hiding (all, rem, span, (**))

import           Colors
import           Layout
import           Type


writings :: Css
writings = do
  ".writing-container" ? do
    ".teaser-only" ? do
      display none

  ".writing" ? do
    backgroundColor pWhite
    sym2 margin (rem 1.618) auto
    maxWidth (px 710)
    forQ [Mq.maxWidth (px 710)] $ do
      maxWidth (pct 70)
    forQ [Mq.maxWidth (px 600)] $ do
      maxWidth (pct 80)
    forQ [Mq.maxWidth (px 400)] $ do
      maxWidth (pct 90)
    forQ [Mq.maxWidth (px 320)] $ do
      maxWidth (pct 95)
    iframe ? do
      flexGrow 1
      flexShrink 1
      flexBasis (rem 0)
    h2 <> h3 ? do
      marginTop (rem 1.1618)
    h2 <> h3 <> h4 <> h5 ? do
      width (pct 100)

    summary ? do
      sansSerifFont
      fontStyle italic
      backgroundColor pGray
      color pHighLight
      marginTop (rem 0.618)
      paddingLeft (rem 0.618)
      paddingRight (rem 0.618)
      width (pct 100)

    details ? do
      width (pct 100)

    ol <> ul ? do
      sym margin (rem 0.618)
      width (pct 100)
    ol <> ul <> li ? do
      serifFont
      fontSize (rem 0.618)
      lineHeight (rem 1)
    p ? do
      sym margin (rem 0.618)
      marginLeft (rem 0)
      serifFont
      lineHeight (rem 1)
      fontSize (rem 0.618)
      width (pct 100)
    figure ? do
      width (pct 100)
    img ? do
      maxWidth (pct 100)
      display flex
      sym2 margin (px 0) auto
      ".small" & do
        maxHeight (px 400)
    ".essay" ? do
      img ? do
        maxHeight (px 600)
        ".small" & do
          maxHeight (px 400)
    figcaption ? do
      display flex
      fontSize (rem 0.618)
      color pGray
      flexAlignCenter
    ".story" ? do
      figure ? do
        width auto
      figcaption ? do
        display none
      img ? do
        maxWidth (pct 100)
        sym2 margin (px 0) (px 0)

    ".toc" ? do
      backgroundColor pGray
      sym padding (rem 0.618)
      star ? do
        sansSerifFont
        color pHighDark
      width (pct 100)
      ".header" ? do
        fontWeight bold
        width (pct 100)
        marginBottom (rem 0.618)
      ul ? do
        sym padding (rem 0)
        sym margin (rem 0)
        width (pct 100)
        listStyleType none
        ul ? do
          paddingLeft (rem 0.618)


    blockquote ? do
      borderLeft (px 4) solid  pGray
      marginTop (rem 0.618)
      marginBottom (px 0)
      paddingTop (px 0)
      paddingBottom (px 0)
      p ? do
        sansSerifFont
        marginTop (px 0)
        marginBottom (px 0)
        paddingTop (px 0)
        paddingBottom (px 0)

      strong ? do
        fontWeight (weight 500)
        fontStyle italic
        textDecoration underline
        color black

    header ? do
      sym margin (rem 0.618)
      a ? do
        color pBlack
        sansSerifFont

    ".row-wise p" ? do
        display flex
        "gap" -: "0.5rem"
        flexAlignCenter
        img ? do
          sym margin (px 0)
          maxWidth (pct 30)

    ".row-wise figure" ? do
        img ? do
          maxWidth (pct 30)

    ".row-wise.wider" ? do
        img ? do
            maxWidth (pct 50)

    ".row-wise.full" ? do
        img ? do
            maxWidth (pct 100)

    ".col-wise p" ? do
        display flex
        flexDirection column
        "gap" -: "0.5rem"
        flexAlignCenter
        img ? do
          maxWidth (pct 30)
          sym margin (px 0)

    ".col-wise figure" ? do
        img ? do
          maxWidth (pct 30)

    ".col-wise.wider" ? do
        img ? do
            maxWidth (pct 50)

    ".col-wise.full" ? do
        img ? do
            maxWidth (pct 100)




    ".sound-cloud" ? do
      marginTop (rem 1)
      sym2 padding (rem 1) (rem 0.1619)
      backgroundColor pHighLight

    ".youtube" ? do
      width (px 330)
      height (px 150)
      forQ [Mq.minWidth (px 600)] $ do
        width (px 560)
        height (px 315)
