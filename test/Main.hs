module Main (main) where

import Md5 (MD5Context (MkMD5Context, regA), initMd5)
import Test.Hspec

main :: IO ()
main = hspec $ do
    describe "test-buffer-correctness" $ do
        it "check A correct" $ do
            let MkMD5Context{regA = a} = initMd5
             in a `shouldBe` 1732584193
