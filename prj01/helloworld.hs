


-- 関数定義
--  myAdd 関数名
--  =の左のx, y :  関数パラメータ
--  =の右  処理をかっく

myAdd x y = x + y


main = do
  putStrLn "Hello World."

  -- doブロックロック内でのセット変数セット(変数束縛)
  let a = myAdd 2 3 

  -- putStrLn ("myAdd 2 3 = " ++ (show a))　と等価
  putStrLn $ "myAdd 2 3 = " ++  (show a)
