curry:: ((a,b) -> c) -> (a -> b -> c)
curry f x y = f (x,y)

uncurry:: (a -> b -> c) -> ((a,b) -> c)
uncurry f (x,y) = f x y


suma :: [Int] -> Int
suma a = foldr (+) 0 a

filterFold :: (a -> Bool) -> [a] -> [a]
filterFold f = foldr (\x rec -> if f x then x : rec else rec) []

mapFold :: (a -> b) -> [a] -> [b]
mapFold f = foldr (\x rec -> f x : rec) []
-- Esto lo que hace es aplicar la funcion lambda de dos parametros sobre el primer elemento
-- x y sobre foldr(... xs), que seria rec.

mejorSegun:: (a -> a -> Bool) -> [a] -> a
mejorSegun f = foldr1 (\x rec -> if (f x rec) then x else rec)
--foldr1 usa el último elemento de la lista como acumulador. Por eso rec siempre es un numero

sumasParciales :: Num a => [a] -> [a] -- esto significa que es de [a] -> [a] y que a es un numero
sumasParciales = foldl (\ac x -> if null ac then [x] else ac ++ [x + last ac]) [] 

partes :: [a] -> [[a]]
partes = foldr (\x ac -> ac ++ (map (x:) ac)) [[]] 

prefijos :: [a] -> [[a]]
prefijos = foldl (\ac x -> ac ++ [((last ac) ++ [x])] ) [[]]

prefijos2 :: [a] -> [[a]]
prefijos2 = tail . scanl (\acc x -> acc ++ [x]) []
--scanl:  	it takes the second argument and the first item of the list and applies the function to them,
-- then feeds the function with this result and the second argument and so on. It returns the list of intermediate and final results. 


-- Recursion estructural. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . foldr
-- Recursion primitiva. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . recr
-- Recursion iterativa. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . foldl

recr :: (a -> [a] -> b -> b) -> b -> [a] -> b
recr _ z [] = z
recr f z (x : xs) = f x xs (recr f z xs)

sacarUna :: Eq a => a -> [a] -> [a] -- a es un tipo que debe poder compararse por igualdad
sacarUna e = recr (\x xs rec -> if x==e then xs else x:rec) []
--un esquema de recursión estructural (fold) no es el adecuado para resolver 
--este problema ya que necesito seguir usando la lista (xs) para operar.

insertarOrdenado :: Ord a => a -> [a] -> [a]
insertarOrdenado a = recr (\x xs rec -> if a<(head xs) then x:a:xs else x:rec) []


foldNat :: (Integer -> Integer -> Integer) -> Integer -> Integer -> Integer
foldNat f z 0 = z
foldNat f z n = f n (foldNat f z (n-1)) 

potencia :: Integer -> Integer -> Integer
potencia n p = foldNat (\x rec -> n*rec) 1 p -- si cambio n por x seria factorial

