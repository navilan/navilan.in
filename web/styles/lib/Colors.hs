{-# LANGUAGE OverloadedStrings #-}
module Colors
where


import           Clay
import           Data.Maybe (fromMaybe)
import qualified Data.Text  as T


setAlpha :: Color -> Float -> Color
setAlpha (Rgba r_ g_ b_ _) a_ = Rgba r_ g_ b_ a_
setAlpha (Hsla h_ s_ l_ _) a_ = Hsla h_ s_ l_ a_
setAlpha o _                  = o


toHex :: Color -> T.Text
toHex c = case value c of
  (Value v) -> plain v


-- color schemes

data ColorScheme a = ColorScheme
  {
    csWhite     :: a
  , csBlack     :: a
  , csGray      :: a
  , csHighDark  :: a
  , csHighLight :: a
  }

instance Functor ColorScheme where
  fmap f (ColorScheme w b g h1 h2) = ColorScheme (f w) (f b) (f g) (f h1) (f h2)

makeScheme :: ColorScheme T.Text -> ColorScheme Color
makeScheme s = fmap parse s


purp :: ColorScheme Color
purp = makeScheme $ ColorScheme "#f5f9e9" "#11151c" "#c2c1a5" "#4a314d" "#6b6570"

scheme :: ColorScheme Color
scheme = purp

pWhite :: Color
pWhite = csWhite scheme

pBlack :: Color
pBlack = csBlack scheme

pGray :: Color
pGray = csGray scheme

pHighDark :: Color
pHighDark = csHighDark scheme

pHighLight :: Color
pHighLight = csHighLight scheme
