module Md5 (initMd5, MD5Context (..)) where

import Data.Word (Word32, Word8)

data MD5Context = MkMD5Context
    { -- Four buffer
      reg :: [Word32]
    , buf :: [Word8]
    }

-- initMd5 return a newly init MD5Context
initMd5 :: MD5Context
initMd5 =
    MkMD5Context
        { reg = [0x67452301, 0xefcdab89, 0x98badcfe, 0x10325476]
        , buf = []
        }

-- updateMD5 :: MD5Context -> String -> Int -> String
