module Main where

import System.IO
import System.Environment
import qualified Data.Map as Map

import CalTFIDF
import Type

-- 表示用の形式にする
eachVectorToShow :: [(Int, Double)] -> String
eachVectorToShow tupleArr = "+1 " ++ unwords (map (\x -> show (fst x) ++ ":" ++ show (snd x)) tupleArr)

main :: IO ()
main = do
  fileNames <- getArgs
  -- if length fileNames == 0 then
  strings <- readFile (head fileNames) -- １つのファイルを読み込み、１行が１ドキュメントとなる

  let documents = lines strings :: [Document]
      splitWords = fmap words documents :: [[String]]
      n = length documents
      tf = calTF splitWords :: [Map.Map String Int]
      df = calDF tf :: [(String, Int)]
      featureVectors = calFeatureVecors n tf df :: [Vector]
      indexVectors = map (zip [1..]) featureVectors :: [[(Int, Double)]]
      not0Vectors = map (filter (\x -> snd x > 0)) indexVectors :: [[(Int, Double)]]
      resultStrs = unlines $ map eachVectorToShow not0Vectors
  -- withFile "svm_light/posLearn.txt" WriteMode $ \handle -> hPutStr handle resultStrs
  putStr resultStrs