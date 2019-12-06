


-- 関数定義
--  myAdd 関数名
--  =の左のx, y :  関数パラメータ。Haskellは引数は()でくくらない。カンマで区切らず、空白区切り
--  =の右  処理を書く
myAdd x y = x + y


main = do
  putStrLn "Hello World."

  -- doブロックロック内でのセット変数セット(変数束縛)
  let a = myAdd 2 3 

  -- putStrLn ("myAdd 2 3 = " ++ (show a))　と等価
  putStrLn $ "myAdd 2 3 = " ++  (show a)
