module MainNeg where

import System.IO
import System.Environment
import qualified Data.Map as Map

import CalTFIDF
import Type

-- 表示用の形式にする
eachVectorToShow :: [(Int, Double)] -> String
eachVectorToShow tupleArr = "-1 " ++ unwords (map (\x -> show (fst x) ++ ":" ++ show (snd x)) tupleArr)

main :: IO ()
main = do
  fileNames <- getArgs
  -- if length fileNames == 0 then
  documents <- sequence $ fmap readFile fileNames

  let n = length fileNames
      splitWords = map (concatMap words . lines) documents :: [[String]]
      tf = calTF splitWords :: [Map.Map String Int]
      df = calDF tf :: [(String, Int)]
      featureVectors = calFeatureVecors n tf df :: [Vector]
      indexVectors = map (zip [1..]) featureVectors :: [[(Int, Double)]]
      not0Vectors = map (filter (\x -> snd x > 0)) indexVectors :: [[(Int, Double)]]
      resultStrs = unlines $ map eachVectorToShow not0Vectors
  withFile "svm_light/negLearn.txt" WriteMode $ \handle -> hPutStr handle resultStrs
