{-# LANGUAGE ImportQualifiedPost #-}

module Retazos where

import Data.ByteString
import Data.ByteString qualified as B
import Prelude hiding (lines)
import Data.List.NonEmpty qualified as N

-- initial index, len
data Range = Range Int Int deriving (Show)

lineRanges :: ByteString -> [Range]
lineRanges bytes =
  let go index crs@(ci : crs') lfs@(li : lfs') = case compare (succ ci) li of
        LT -> Range index (index - ci) : go (succ ci) crs' lfs
        EQ -> Range index (index - ci) : go (succ li) crs' lfs'
        GT -> Range index (index - li) : go (succ li) crs lfs'
      go index crs@(ci : crs') [] =
        Range index (index - ci) : go (succ ci) crs' []
      go index [] lfs@(li : lfs') =
        Range index (index - li) : go (succ li) [] lfs'
      go index [] [] =
        if index == B.length bytes
        then []
        else [Range index (B.length bytes - index)]
   in go 0 (B.elemIndices 0x0A bytes) (B.elemIndices 0x0D bytes)

lines :: ByteString -> [ByteString]
lines = undefined
