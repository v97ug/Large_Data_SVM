module CalTFIDF where

import Type
import qualified Data.Map as Map
import Data.Maybe
import Control.Arrow
import Data.List
import qualified Data.ByteString.Lazy.Char8 as B

calTFIDF :: Int -> Int -> Int -> Double
calTFIDF n tf df =
  let n' = fromIntegral n
      tf' = fromIntegral tf
      df' = fromIntegral df
  in tf' * log (n' / df')

calFeatureVecors :: Int -> [Map.Map B.ByteString Int] -> [(B.ByteString, Int)] -> [Vector]
calFeatureVecors n tf df = map (\oneTF -> eachDocument n oneTF df) tf

eachDocument :: Int -> Map.Map B.ByteString Int -> [(B.ByteString, Int)] -> Vector
eachDocument n tf = map (eachWord n tf)

eachWord :: Int -> Map.Map B.ByteString Int -> (B.ByteString, Int) -> Double
eachWord n tf (dfWord, dfCount) =
  let tfValue = Map.lookup dfWord tf in
  if isNothing tfValue then 0 else calTFIDF n (fromJust tfValue) dfCount

calTF :: [[B.ByteString]] -> [Map.Map B.ByteString Int]
calTF = fmap (Map.fromList . toWordCountTuple)

-- example. ["aaa","bbb","aaa"] -> [("aaa",2),("bbb",1)]
toWordCountTuple :: [B.ByteString] -> [(B.ByteString, Int)]
toWordCountTuple = fmap (head &&& length) . group . sort

calDF :: [Map.Map B.ByteString Int] -> [(B.ByteString, Int)]
calDF tf =
  let words' = concatMap Map.keys tf :: [B.ByteString]
  in toWordCountTuple words'
