{-# LANGUAGE ImportQualifiedPost #-}

module Retazos (Range(..), lineRanges) where

import Data.ByteString
import Data.ByteString qualified as B
import Prelude hiding (lines)
import Data.List.NonEmpty qualified as N

import Debug.Trace

-- initial index, len
data Range = Range Int Int deriving (Show, Eq, Ord)

lineRanges :: ByteString -> [Range]
lineRanges bytes =
  let go index crs@(ci : crs') lfs@(li : lfs') = case compare (succ ci) li of
        LT -> Range index (ci - index) : go (succ ci) crs' lfs
        EQ -> Range index (ci - index) : go (succ li) crs' lfs'
        GT -> Range index (li - index) : go (succ li) crs lfs'
      go index crs@(ci : crs') [] =
        Range index (ci - index) : go (succ ci) crs' []
      go index [] lfs@(li : lfs') =
        Range index (li - index) : go (succ li) [] lfs'
      go index [] [] =
        if index == B.length bytes
        then []
        else [Range index (B.length bytes - index)]
   in go 0 (B.elemIndices 0x0D bytes) (B.elemIndices 0x0A bytes)

-- lines :: ByteString -> [ByteString]
-- lines = undefined
