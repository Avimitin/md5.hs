module Main (main) where

import Md5 (MD5Context (MkMD5Context, reg), initMd5, updateMD5)
import Test.Hspec

main :: IO ()
main = hspec $ do
    describe "test-init-buffer-correctness" $ do
        it "check A correct" $ do
            let MkMD5Context{reg = reg} = initMd5
             in length reg `shouldBe` 4
    describe "test-update-buffer-correctness" $ do
        it "check same context when input len == 0" $ do
            let ctx = initMd5
             in updateMD5 ctx [] 0 `shouldBe` ctx
