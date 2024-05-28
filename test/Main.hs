module Main (main) where

import Md5 (MD5Context (MkMD5Context, reg), initMd5)
import Test.Hspec

main :: IO ()
main = hspec $ do
    describe "test-buffer-correctness" $ do
        it "check A correct" $ do
            let MkMD5Context{reg = reg} = initMd5
             in head reg `shouldBe` 1732584193
