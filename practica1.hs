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

