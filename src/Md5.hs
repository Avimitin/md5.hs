module Md5 (initMd5, updateMD5, MD5Context (..)) where

import Data.Bits
import Data.Word (Word32, Word8)

data MD5Context = MkMD5Context
    { -- Four buffer
      reg :: [Word32]
    , nL :: Int
    , nR :: Int
    , buf :: [Word8]
    , num :: Int
    }
    deriving (Show, Eq)

-- initMd5 return a newly init MD5Context
initMd5 :: MD5Context
initMd5 =
    MkMD5Context
        { reg = [0x67452301, 0xefcdab89, 0x98badcfe, 0x10325476]
        , buf = []
        , nL = 0
        , nR = 0
        , num = 0
        }

-- Update MD5Context by length :: Int of input :: [Word8]
updateMD5 :: MD5Context -> [Word8] -> Int -> MD5Context
-- TODO: Implement actual digest

-- First case: when len = 0, return original context
updateMD5 ctx _ 0 = ctx
-- Second case, return updated data
updateMD5 ctx input len =
    let
        MkMD5Context{reg = reg', nL = nL', nR = nR', buf = buf', num = num'} = ctx
        (a : b : c : d : _) = reg'
     in
        -- TODO: Update nL and nR
        MkMD5Context{reg = reg', nL = nL', nR = nR', buf = buf', num = num'}

{-
  Copied from BoringSSL:

  As pointed out by Wei Dai <weidai@eskimo.com>, the above can be
  simplified to the code below.  Wei attributes these optimizations
  to Peter Gutmann's SHS code, and he attributes it to Rich Schroeppel.

    #define F(b, c, d) ((((c) ^ (d)) & (b)) ^ (d))
    #define G(b, c, d) ((((b) ^ (c)) & (d)) ^ (c))
    #define H(b, c, d) ((b) ^ (c) ^ (d))
    #define I(b, c, d) (((~(d)) | (b)) ^ (c))
-}
fnF :: Word32 -> Word32 -> Word32 -> Word32
fnF b c d = ((c .^. d) .&. b) .^. d

fnG :: Word32 -> Word32 -> Word32 -> Word32
fnG b c d = ((b .^. c) .&. d) .^. c

fnH :: Word32 -> Word32 -> Word32 -> Word32
fnH b c d = b .^. c .^. d

{-# ANN fnI "HLint: ignore Redundant bracket" #-}
fnI :: Word32 -> Word32 -> Word32 -> Word32
fnI b c d = ((complement d) .|. b) .^. c
