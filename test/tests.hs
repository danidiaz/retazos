{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE ImportQualifiedPost #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE NamedFieldPuns #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE StandaloneKindSignatures #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE UndecidableInstances #-}

module Main (main) where

import Data.ByteString
import Data.ByteString qualified as B
import Data.Text
import Data.Text qualified as T
import Data.Text.Encoding (encodeUtf8)
import Retazos
import System.IO
import Test.Tasty
import Test.Tasty.HUnit
import Prelude hiding (log)

--
--
--

tests :: TestTree
tests =
  testGroup
    "All"
    [ testGroup
        "Basic"
        [ testCase "empty" $
            assertEqual
              ""
              ([])
              (lineRanges (encodeUtf8 "")),
          testCase "one" $
            assertEqual
              ""
              ([Range 0 1])
              (lineRanges (encodeUtf8 "a")),
          testCase "two" $
            assertEqual
              ""
              ([Range 0 2])
              (lineRanges (encodeUtf8 "aa"))
        ],
      testGroup
        "Splits"
        [ 
           testCase "rn" $
            assertEqual
              ""
              ([Range 0 1, Range 3 1])
              (lineRanges (encodeUtf8 "a\r\na")),
           testCase "nr" $
            assertEqual
              ""
              ([Range 0 1, Range 2 0, Range 3 1])
              (lineRanges (encodeUtf8 "a\n\ra")),
           testCase "rn at end" $
            assertEqual
              ""
              ([Range 0 1])
              (lineRanges (encodeUtf8 "a\r\n")),
           testCase "nr at end" $
            assertEqual
              ""
              ([Range 0 1, Range 2 0])
              (lineRanges (encodeUtf8 "a\n\r"))

        ]
    ]

main :: IO ()
main = defaultMain tests
