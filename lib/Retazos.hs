{-# LANGUAGE ImportQualifiedPost #-}
module Retazos where

import Prelude hiding (lines)
import Data.ByteString
import Data.ByteString qualified as B

data Range = Range Int Int deriving Show

lines :: ByteString -> [Range]
lines bytes = 
    let go index crs lfs = undefined
     in go 0 (B.elemIndices 0x0A bytes) (B.elemIndices 0x0D bytes)
