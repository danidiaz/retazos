{-# LANGUAGE ImportQualifiedPost #-}
{-# LANGUAGE BlockArguments #-}
{-# LANGUAGE OverloadedStrings #-}
module Retazos.Main where

import System.Environment
import Data.ByteString (ByteString)
import Data.ByteString qualified as B
import Retazos
import Prelude hiding (lines)
import Data.Foldable
import System.IO

defaultMain :: IO ()
defaultMain = do
    filePath : _ <- getArgs
    text <- B.readFile filePath
    let ls = lines text
    for_ ls \line ->
        do B.putStr line
           B.putStr "\n"
           hFlush stdout
           B.getLine
    pure ()

