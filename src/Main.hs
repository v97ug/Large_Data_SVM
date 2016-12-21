module Main where

import System.Environment
import qualified Data.Map as Map

import CalTFIDF
import Type
import qualified Data.ByteString.Lazy.Char8 as B

-- 表示用の形式にする
eachVectorToShow :: String -> [(Int, Double)]  -> String
eachVectorToShow classifyValue tupleArr = classifyValue ++ " " ++ unwords (map (\x -> show (fst x) ++ ":" ++ show (snd x)) tupleArr)

main :: IO ()
main = do
  {--
  プログラムの実行の仕方
  ./progName posOrNegValue fileNames
  例↓
  ./Main +1 test1.txt test2.txt
  --}
  (classifyValue:fileNames) <- getArgs
  -- if length fileNames == 0 then
  documents <- sequence $ fmap B.readFile fileNames

  let n = length fileNames
      splitWords = fmap (concatMap B.words . B.lines) documents :: [[B.ByteString]]
      tf = calTF splitWords :: [Map.Map B.ByteString Int]
      df = calDF tf :: [(B.ByteString, Int)]
      featureVectors = calFeatureVecors n tf df :: [Vector]
      indexVectors = map (zip [1..]) featureVectors :: [[(Int, Double)]]
      not0Vectors = map (filter (\x -> snd x > 0)) indexVectors :: [[(Int, Double)]]
      resultStrs = unlines $ map (eachVectorToShow classifyValue) not0Vectors
  putStr resultStrs
