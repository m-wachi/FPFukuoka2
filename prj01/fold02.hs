import Data.Time
import qualified Data.Time.Calendar as Cal
import qualified Data.Time.Calendar.WeekDate as CalWD -- package time-1.6.0.1
import qualified Control.Monad as CM

import MyMdl01

prepareData = [
  RecordDay (fromGregorian 2019 12 2) "A001" (fromIntegral 10),
  RecordDay (fromGregorian 2019 12 3) "A001" (fromIntegral 20),
  RecordDay (fromGregorian 2019 12 4) "A001" (fromIntegral 30),
  RecordDay (fromGregorian 2019 12 5) "A001" (fromIntegral 40),
  RecordDay (fromGregorian 2019 12 6) "A001" (fromIntegral 50),
  RecordDay (fromGregorian 2019 12 7) "A001" (fromIntegral 60),
  RecordDay (fromGregorian 2019 12 8) "A001" (fromIntegral 70),
  RecordDay (fromGregorian 2019 12 9) "A001" (fromIntegral 80),
  RecordDay (fromGregorian 2019 12 10) "A001" (fromIntegral 90),
  RecordDay (fromGregorian 2019 12 11) "A001" (fromIntegral 100),
  RecordDay (fromGregorian 2019 12 12) "A001" (fromIntegral 110),
  RecordDay (fromGregorian 2019 12 13) "A001" (fromIntegral 120),
  RecordDay (fromGregorian 2019 12 14) "A001" (fromIntegral 130),
  RecordDay (fromGregorian 2019 12 15) "A001" (fromIntegral 140)]

mergeRecWeekB :: RecordWeek -> [RecordWeek] -> [RecordWeek]
mergeRecWeekB rw1 [] = [rw1]
mergeRecWeekB rw1 lstRw
  | rw0Monday == monday rw1 && rw0MercCd == rwMercCd rw1 = (mergeRecWeekA rw0 rw1) : (tail lstRw)
  | otherwise = rw1 : lstRw
  where
    rw0 = head lstRw
    rw0Monday = monday rw0
    rw0MercCd = rwMercCd rw0


accumRecWeekB acc [] = acc
accumRecWeekB acc lstWk =
  accumRecWeekB acc1 $ tail lstWk
  where
    acc1 = mergeRecWeekB (head lstWk) acc


main = do
  let lstRecDay = prepareData

  putStrLn "lstRecDay------------------------"
  mapM print lstRecDay
  putStrLn ""

  let lstRecWeek = map convDay2Week $ prepareData
  putStrLn "lstRecWeek-----------------------"
  mapM print lstRecWeek
  putStrLn ""


  let w2 = head lstRecWeek
  let w3 = lstRecWeek !! 2
  let w4 = mergeRecWeekB w2 [w3]

  putStrLn "mergeRecWeekB lstRecWeek[0] + [lstRecWeek[2]]-----"
  print w4
  putStrLn ""

  let w5 = lstRecWeek !! 8
  let w6 = mergeRecWeekB w2 [w5]

  putStrLn "mergeRecWeekB lstRecWeek[0] + [lstRecWeek[8]]-----"
  print w6
  putStrLn ""


  let w7 = accumRecWeekB [] lstRecWeek
  putStrLn "accumRecWeekB lstRecWeek--------------------"
  print w7
  putStrLn ""

  let w8 = foldr mergeRecWeekB [] lstRecWeek
  putStrLn "foldr lstRecWeek--------------------"
  print w8
  putStrLn ""
