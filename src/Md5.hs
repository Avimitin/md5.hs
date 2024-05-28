module Md5 (initMd5, MD5Context (..)) where

data MD5Context = MkMD5Context
    { -- Four buffer
      regA :: Int
    , regB :: Int
    , regC :: Int
    , regD :: Int
    }

-- initMd5 return a newly init MD5Context
initMd5 :: MD5Context
initMd5 = MkMD5Context{regA = 0x67452301, regB = 0xefcdab89, regC = 0x98badcfe, regD = 0x10325476}
