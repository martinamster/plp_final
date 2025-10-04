valorAbsoluto :: Float -> Float
valorAbsoluto x = if x < 0 then -x else x

factorial :: Int-> Int
factorial 1 = 1
factorial x = x * factorial (x-1)

cantDivisoresPrimos :: Int -> Int
cantDivisoresPrimos x = length (divisoresPrimos x)

divisoresPrimos :: Int -> [Int]
divisoresPrimos x = [y | y <- [1..x], esPrimo y, mod x y == 0]

esPrimo :: Int -> Bool
esPrimo n = n > 1 && null [x | x <- [2..isqrt n], mod n x == 0]
  where isqrt = floor . sqrt . fromIntegral

inverso :: Float -> Maybe Float
inverso 0 = Nothing
inverso x = Just (1/x)

eliminarCaracter :: Char -> String -> String
eliminarCaracter x [] = []
eliminarCaracter x (y:ys) | x == y = ys
                          | otherwise = y : eliminarCaracter x ys


limpiar :: String -> String -> String
limpiar (x:xs) str = limpiar xs (eliminarCaracter x str)
limpiar x str = str

todosIguales :: [Int] -> Bool
todosIguales [] = True
todosIguales [_] = True
todosIguales (x:xs) = (x == head xs) && todosIguales xs 


data AB a = Nil | Bin (AB a) a (AB a)

vacioAB :: AB a -> Bool
vacioAB Nil = True
vacioAB a = False

negacionAB :: AB Bool -> AB Bool
negacionAB Nil = Nil
negacionAB (Bin a b c) = Bin (negacionAB a) (not b) (negacionAB c)