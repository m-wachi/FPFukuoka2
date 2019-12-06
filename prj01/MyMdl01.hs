module MyMdl01 where

import Data.Time
import qualified Data.Time.Calendar as Cal
import qualified Data.Time.Calendar.WeekDate as CalWD -- package time-1.6.0.1

-- １レコード１日のデータ
--   salesDate: 売上日
--   rdMercCd:  商品コード
--   salesAmt:  売上金額
data RecordDay = RecordDay { salesDate :: Day, rdMercCd :: String, salesAmt :: Int } deriving Show

-- １レコード１週間のデータ
--   monday:      売上週の月曜売上日
--   rwMercCd:    商品コード
--   salesAmtMon: 月曜売上金額
--   salesAmtTue～Sun: 火曜～日曜売上金額
data RecordWeek = RecordWeek { monday :: Day, rwMercCd :: String,
                               salesAmtMon :: Int, salesAmtTue :: Int, salesAmtWed :: Int,
                               salesAmtThu :: Int, salesAmtFri :: Int, salesAmtSat :: Int,
                               salesAmtSun :: Int } deriving Show

-- 当週の月曜日を取得
getThisMonday :: Cal.Day -> Cal.Day
getThisMonday dayVal = Cal.addDays (fromIntegral $ 1 - dow) dayVal
  where
        (_, _, dow) = CalWD.toWeekDate dayVal


-- RecordDayをRecordWeekに変換
convDay2Week (RecordDay sd mercCd sla)
  | 1 == dow = RecordWeek thisMonday mercCd sla 0 0 0 0 0 0
  | 2 == dow = RecordWeek thisMonday mercCd 0 sla 0 0 0 0 0
  | 3 == dow = RecordWeek thisMonday mercCd 0 0 sla 0 0 0 0
  | 4 == dow = RecordWeek thisMonday mercCd 0 0 0 sla 0 0 0
  | 5 == dow = RecordWeek thisMonday mercCd 0 0 0 0 sla 0 0
  | 6 == dow = RecordWeek thisMonday mercCd 0 0 0 0 0 sla 0
  | 7 == dow = RecordWeek thisMonday mercCd 0 0 0 0 0 0 sla
  | otherwise =  RecordWeek thisMonday "DUMMY" 0 0 0 0 0 0 0
  where
    (_, _, dow) = CalWD.toWeekDate sd
    thisMonday = getThisMonday sd

-- 2つのRecordWeekをマージ
mergeRecWeekA rw1 rw2 =
    RecordWeek rw1Monday rw1MercCd retSalesAmtMon retSalesAmtTue retSalesAmtWed retSalesAmtThu retSalesAmtFri retSalesAmtSat retSalesAmtSun
  where
    rw1Monday = monday rw1
    rw1MercCd = rwMercCd rw1
    retSalesAmtMon = (salesAmtMon rw1) + (salesAmtMon rw2)
    retSalesAmtTue = (salesAmtTue rw1) + (salesAmtTue rw2)
    retSalesAmtWed = (salesAmtWed rw1) + (salesAmtWed rw2)
    retSalesAmtThu = (salesAmtThu rw1) + (salesAmtThu rw2)
    retSalesAmtFri = (salesAmtFri rw1) + (salesAmtFri rw2)
    retSalesAmtSat = (salesAmtSat rw1) + (salesAmtSat rw2)
    retSalesAmtSun = (salesAmtSun rw1) + (salesAmtSun rw2)

