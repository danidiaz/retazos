{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE ImportQualifiedPost #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE NamedFieldPuns #-}
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
    []

main :: IO ()
main = defaultMain tests
