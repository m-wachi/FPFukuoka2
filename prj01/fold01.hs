import Data.Time
import qualified Data.Time.Calendar as Cal
import qualified Data.Time.Calendar.WeekDate as CalWD -- package time-1.6.0.1

import MyMdl01

-- テストデータの準備
prepareData = [
  RecordDay (fromGregorian 2019 12 2) "A001" (fromIntegral 10),
  RecordDay (fromGregorian 2019 12 3) "A001" (fromIntegral 20),
  RecordDay (fromGregorian 2019 12 4) "A001" (fromIntegral 30),
  RecordDay (fromGregorian 2019 12 5) "A001" (fromIntegral 40),
  RecordDay (fromGregorian 2019 12 6) "A001" (fromIntegral 50),
  RecordDay (fromGregorian 2019 12 7) "A001" (fromIntegral 60),
  RecordDay (fromGregorian 2019 12 8) "A001" (fromIntegral 70)]
  

main = do
  let lstRecDay = prepareData

  putStrLn "lstRecDay------------------------"
  mapM print lstRecDay
  putStrLn ""

  -- １日分のデータを１週間の形式に変換
  let w1 = convDay2Week $ head lstRecDay

  putStrLn "lstRecDay[0] -> RecordWeek-------"
  print w1
  putStrLn ""

  let lstRecWeek = map convDay2Week $ prepareData
  putStrLn "lstRecWeek-----------------------"
  mapM print lstRecWeek
  putStrLn ""

  let w2 = head lstRecWeek
  let w3 = head $ tail $ lstRecWeek
  let w4 = mergeRecWeekA w2 w3

  putStrLn "lstRecWeek[0] + lstRecWeek[1]-----"
  print w4
  putStrLn ""

  let w5 = foldr mergeRecWeekA w2 (tail lstRecWeek)

  putStrLn "fold lstRecWeek--------------------"
  print w5
  putStrLn ""
