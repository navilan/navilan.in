module Gold
where


import           Clay
import qualified Data.Text as T


phi :: Double
phi = 1.618


phi' :: Double
phi' = phi - 1


full :: Double
full   = 100


gcols :: Integer
gcols  = 12


golds' :: Double -> [(Integer, Double)]
golds' gld =
  foldr wid [] [1 .. gcols]
  where
    wid :: Integer -> [(Integer, Double)] -> [(Integer, Double)]
    wid num []                                = [(num, full)]
    wid num lst@((_, prev) : [])              = (num, prev / gld) : lst
    wid num lst@((_, prev1) : (_, prev2) : _)
      | even (gcols - num)                    = (num, prev2 - prev1) : lst
      | otherwise                             = (num, prev1 / gld) : lst


golds :: [(Integer, Double)]
golds = golds' phi


golden' :: Double -> ((Integer, Double) -> Css) -> Css
golden' gld gsec = mapM_ gsec (golds' gld)


golden :: ((Integer, Double) -> Css) -> Css
golden = golden' phi


goldenGrid' :: String -> Double -> Css
goldenGrid' pref gld =
  golden' gld gsec
  where
    el num      = element . T.pack $ (pref ++ (show num))
    gunit       = pct
    gsec (n, w) = el n ? width (gunit w)


goldenGrid :: Css
goldenGrid = do
  goldenGrid' ".gld-" phi
  goldenGrid' ".gld-m-" (2 * phi)
