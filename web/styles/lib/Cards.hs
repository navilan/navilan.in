{-# LANGUAGE OverloadedLists   #-}
{-# LANGUAGE OverloadedStrings #-}
module Cards
where


import           Clay
import qualified Clay.Media as Mq
import           Prelude    hiding (all, rem, (**))


import           Colors
import           Layout
import           Type


cardsStyle :: Css
cardsStyle = do

  ".cards" ? do
    flexAlignStart
    justifyContent spaceBetween
    backgroundColor pWhite
    sym padding (rem 0.618)
    ".reverse" & do
      flexWrap wrapReverse
      flexDirection rowReverse

    ".card" ? do
      boxShadow [bsColor pGray $ shadowWithBlur (px 0) (px 1) (rem 0.1618)]
      sym borderRadius (rem 0.5)
      flexAlignCenter
      listStyleType none
      sym margin (rem 1)
      minWidth (px 248)
      backgroundColor pWhite
      color pBlack
      sym padding (rem 1)
      justifyContent spaceBetween

      ".toc" ? do
        display none

      ".card-title" ? do

        flexAlignCenter
        maxHeight (rem 3)
        fontWeight bold
        textAlign center

        after & do
          display flex
          flexDirection row
          flexAlignCenter
          content (stringContent "")
          height (rem 0.1618)
          width (pct 100)
          sym padding (rem 0)
          borderBottom (px 1) solid  pGray

      ".card-subtitle" ? do
        display flex
        flexDirection row
        flexAlignCenter
        sansSerifFont
        fontWeight normal
        fontSize (rem 0.3618)
        maxWidth (rem 24)
        sym2 padding (rem 0) (rem 0.1618)
        lineHeight (rem 0.618)
        color pHighLight

      ".card-details" ? do
        sansSerifFont
        fontWeight normal
        maxWidth (rem 24)

        figure ? do
          display flex
          flexAlignCenter
          flexGrow 1
          paddingBottom (rem 0.1618)
          width (pct 100)

        img ? do
          display flex
          flexDirection row
          flexAlignCenter
          maxHeight (px 120)
          maxWidth (px 120)


        figcaption ? do
          display none

      ".card-cfa" ? do
        flexAlignEnd
        height (rem 2)
        sym padding (rem 0)
        sym margin (rem 0)
        width (pct 100)
        fontWeight normal
        maxWidth (pct 100)
        borderTop (px 1) solid  pGray
        color pGray
        textShadow (px 0) (px 1) (px 0) (setAlpha pHighLight 0.8)
        hover & do
          color pHighLight
          textShadow (px 0) (px 1) (px 0) (setAlpha pHighDark 0.8)


  ".cards" ? do
    ".story" & do
      sym padding (rem 0)
  ".card" ? do
    ".story" & do
      backgroundColor white
      maxWidth (pct 100)
      figure ? do
        display flex
        flexAlignStart
        maxWidth (pct 40)
        minWidth(px 280)
      figcaption ? do
        display none
      p ? do
        display flex
        flexAlignStart
        width auto


  a ? do
    ".card" & do
      ".small" ? do
        fontSize (rem 0.4)
        color pGray
      hover & do
        color pHighDark


  ".cards.grid" ? do
    maxWidth (px 320)


  forQ [Mq.maxWidth (px 600)] $ do
    ".cards" ? do
      ".card" ? do
        sym2 margin (rem 0.618) (rem 0)
    ".cards.grid" ? do
      maxWidth (pct 100)

  forQ [Mq.maxWidth (px 640)] $ do
    ".cards" ? do
      ".card" ? do
        ".story" & do
          flexAlignCenter
          figure ? do
            maxWidth (pct 100)
            flexAlignCenter

  forQ [Mq.maxWidth (px 300)] $ do
    ".cards" ? do
      ".card" ? do
        ".story" & do
          figure ? do
            minWidth (pct 80)
