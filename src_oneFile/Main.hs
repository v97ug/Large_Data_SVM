module Main where

import System.Environment
import qualified Data.Map as Map

import CalTFIDF
import Type
import qualified Data.ByteString.Char8 as B

-- 表示用の形式にする
-- 例：　+1 2:0.1232131 5:0.99123
eachVectorToShow :: B.ByteString -> [(Int, Double)]  -> B.ByteString
eachVectorToShow classifyValue tupleArr =
  classifyValue `B.append` B.pack " " `B.append`
  B.unwords (fmap (\x -> B.pack (show (fst x) ++ ":" ++ show (snd x))) tupleArr)

main :: IO ()
main = do
  {--
  プログラムの実行の仕方
  ./progName posOrNegValue oneFileName
  例↓
  ./Main +1 test1.txt
--}
  (classifyValue:fileName:_) <- getArgs
  -- if length fileNames == 0 then
  strings <- B.readFile fileName -- １つのファイルを読み込み、１行が１ドキュメントとなる

  let documents = B.lines strings :: [Document]
      splitWords = fmap B.words documents :: [[B.ByteString]]
      n = length documents
      tf = calTF splitWords :: [Map.Map B.ByteString Int]
      df = calDF tf :: [(B.ByteString, Int)]
      featureVectors = calFeatureVecors n tf df :: [Vector]
      indexVectors = map (zip [1..]) featureVectors :: [[(Int, Double)]]
      not0Vectors = map (filter (\x -> snd x > 0)) indexVectors :: [[(Int, Double)]]
      resultStrs = B.unlines $ fmap (eachVectorToShow (B.pack classifyValue)) not0Vectors
  B.putStr resultStrs
