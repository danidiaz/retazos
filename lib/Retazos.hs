{-# LANGUAGE ImportQualifiedPost #-}

module Retazos where

import Data.ByteString
import Data.ByteString qualified as B
import Prelude hiding (lines)

data Range = Range Int Int deriving (Show)

lines :: ByteString -> [Range]
lines bytes =
  let go index crs@(ci : crs') lfs@(li : lfs') = case compare (succ ci) li of
        LT -> Range index (index - ci) : go (succ ci) crs' lfs
        EQ -> Range index (index - ci) : go (succ li) crs' lfs'
        GT -> Range index (index - li) : go (succ li) crs lfs'
   in go 0 (B.elemIndices 0x0A bytes) (B.elemIndices 0x0D bytes)
