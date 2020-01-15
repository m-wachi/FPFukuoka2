# FPFukuoka: Haskellでのfold関数の使用例

## はじめに
- Haskellは純粋関数型プログラミング言語(by Wikipedia)
- Haskellでプログラムを書こうとすると、（基本は）関数型プログラミングを強制されるので、関数型プログラミングを勉強するのにはもってこい
- 関数プログラミングといえば、mapとreduce
- reduceはHaskellではfoldr(またはfoldl)
- ということで、foldrを使ったプログラムを紹介

## やりたいこと
|売上日|商品CD|売上金額|
|:----|:-----|------:|
|12/2(月)|A001|100|
|12/3(火)|A001|200|
|12/4(水)|A001|300|
|12/5(木)|A001|400|
|12/6(金)|A001|500|
|12/7(土)|A001|600|
|12/8(日)|A001|700|
|12/9(月)|A001|800|
|12/10(火)|A001|900|
|12/11(水)|A001|1,000|

を

|月曜日|商品CD|月売上|火売上|水売上|木売上|金売上|土売上|日売上|
|:----|:-----|-----:|----:|----:|----:|----:|-----:|----:|
|12/2|A001|100|200|300|400|500|600|700|
|12/9|A001|200|800|900|1000|||

に変換したい

## Haskellちょっとだけ説明
使うコンパイラ GHC(glasgow haskell compiler)。Haskellのデファクトスタンダード

### インストール
- Windows: https://www.haskell.org/platform/windows.html
- Linux debian： apt-get install ghc
- Mac: わかりません

### 使い方
- ghc: コンパイラ　使用法は各自でググって
- runghc: インタプリタ $ runghc (ファイル名)
- ghci: 対話型インタプリタ

### 簡単説明

#### まずはHelloWorld
runghc helloworld.hs

#### 関数定義
```Haskell
-- 関数定義
--  myAdd 関数名
--  =の左のx, y :  関数パラメータ。Haskellは引数は()でくくらない。カンマで区切らず、空白区切り
--  =の右  処理を書く
myAdd x y = x + y
```
- Haskellでは基本は”１ステップづつ実行”という形はない。ただし、doブロックを使うとできる。(この後のmain関数)
- letやwhereを使うことで、読みやすくすることはできる

## 本編解説
 MyMdl01.hs
（プログラムの中のコメントに書いたほうがわかりやすい）
型の説明<br>
RecordDay: １レコード１日の売上データ<br>
RecordWeek: １レコード１週間の売上データ<br>

Haskellについての説明<br>
Haskellでは"data"で始まるのはCでいうところの構造体定義と近い<br>
"data"の後ろの"RecordDay"が型名。salesDateやrdMercCdがメンバでありかつメンバ取得関数<br>
rw1MercCd = rwMercCd rw1でRecordWeek型の変数rw1からrwMercCdメンバの値を取得し、rw1MercCdに設定する<br>


処理の説明<br>
convDay2Week: RecordDayをRecordWeekに変換



reduce

Fold(JavaScriptではreduce）について説明します。

