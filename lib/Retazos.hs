module Retazos where

import Prelude hiding (lines)
import Data.ByteString

data Range = Range Int Int deriving Show

lines :: ByteString -> [Range]
lines = undefined

