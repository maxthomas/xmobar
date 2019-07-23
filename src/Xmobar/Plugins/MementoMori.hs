module Xmobar.Plugins.MementoMori (MementoMori(..)) where

import Xmobar.Run.Exec(Exec(..))
import MementoMori(yearsAlive)
import Data.Time
import Text.Printf

data MementoMori = MementoMori Integer Int Int
    deriving (Read, Show)

instance Exec MementoMori where
    alias (MementoMori _ _ _) = "mementoMori"
    run   (MementoMori y m d) = do
      now <- getCurrentTime
      let yrsAlive = yearsAlive (fromGregorian y m d) now :: Float
      let strVers = printf "%.4f" yrsAlive :: String
      return strVers
