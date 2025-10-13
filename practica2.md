# Practica 2

### Ejercicio 1
Demostrar las siguientes igualdades usando los principios de extensionalidad cuando sea necesario
#### I) 
$\forall p::(a,b).\ \ intercambiar\ (intercambiar\ p) = p$ 
```haskell
-- Por principio de extensionalidad para pares basta ver que ∀p :: (a,b). ∃x::a. ∃y::b. p = (x,y).
intercambiar (intercambiar (x,y)) = (x,y)

intercambiar (intercambiar (x,y))
{I1} = intercambiar (y,x)
{I1} = (x,y)
{EP} = p -- extensionalidad de pares?
```

#### II)
$\forall p::(a,(b,c)).\ \ asociarD (asociarI\ p) = p$
``` haskell
-- Por principio de extensionalidad para pares basta ver que ∀p :: (a,d). ∃x::a. ∃w::d. p = (x,w).
-- Por principio de extensionalidad para pares basta ver que ∀w :: (b,c). ∃y::b. ∃z::c. w = (y,z).
asociarD (asociarI (x,(y,z)))
{AI1} = asociarD ((x,y),z)
{AD1} = (x,(y,z))
{EP}  = p
```

### Ejercicio 2
#### I)
$flip\ .\ flip = id$
```haskell
-- Por principio de extensionalidad funcional basta ver que ∀f::a->b->c. ∀x::a. ∀y::b.
-- Demostrar
(flip . flip) f x y = id f x y
{D .} flip (flip f x y) -- Por algun axioma del puntito de concatenacion 
{F1} flip f y x
{F1} f x y
-- ahora llegué a eso, hago crecer aplicando id
{ID} id f x y
```

#### II)
$\forall f :: (a,b)->c.\ \ uncurry (curry\ f) = f$
```haskell
-- Por principio de extensionalidad funcional basta ver que ∀f::(a,b)->c. ∀p :: (a,b).

-- Demostrar
uncurry (curry f) p = f p --y aca me falta reemplazar el par

-- Por principio de extensionalidad para pares basta ver que ∀f::(a,b)->c. ∀p :: (a,b). ∃x::a. ∃y::b. p = (x,y).

-- Demostrar
uncurry (curry f) (x,y) = f (x,y)
{U1} (curry f) x y
{C1} f (x,y)
```
#### III)
$flip\ const = const\ id$
```haskell
-- Por principio de extensionalidad funcional basta ver que ∀x::a. ∀y::b.
flip const x y = const id x y
-- DUDA, por qué vale? 
```

### Ejercicio 3
#### I)
 $\forall\ xs::[a] .\ length (duplicar\ xs) = 2 * length\ xs$
```haskell
-- Por principio de induccion estructural sobre listas.

-- Caso base P([]):
length(duplicar []) = 2*length []
{D0} length([])
{L0} 0
{M0} 2*0 --no se que regla sería pero vale
{L0} 2*length []

-- Paso inductivo ∀x::a. ∀xs::[a]. Usando P(xs) como hipotesis inductiva, quiero ver que P(x:xs):
length(duplicar (x:xs)) = 2*length (x:xs)
{D1} length (x:x:duplicar xs)
{L1} 1 + length (x:duplicar xs)
{L1} 2 + length (duplicar xs) -- Aca aplique sumar tambien
{HI} 2 + 2*length xs
{Factor comun 2} 2*(1 + length xs) -- no se si se hace asi este paso
{L1} 2 * length (x:xs) 

```

#### II)
 $\forall xs::[a] .\ \forall ys::[a] .\ length\ (append\ xs\ ys) = length\ xs + length\ ys$
 ```haskell
 -- Por inducción estructural sobre listas

 -- Hago inducción sobre xs. Asumo que vale P(xs) y quiero probar P(x:xs) ∀x::a. ∀xs::[a]

 --Caso base P([]):
 length (append [] ys) = length [] + length ys
 {A0} length ys
 {no se} 0 + length ys
 {L0} length [] + length ys

-- Paso inductivo ∀x::a. ∀xs::[a]. Usando P(xs) como hipotesis inductiva, quiero ver que P(x:xs):
length (append (x:xs) ys) = length (x:xs) + length ys
{A1} length (x : append xs ys)
{L1} 1 + length (append xs ys)
{HI} 1 + length xs + length ys
{L1} length (x:xs) + length ys
 ```

 #### V)
 $∀ xs::[a] . ∀ p::a->Bool .\ ∀ e::a .\ ((elem\ e\ (filter\ p\ xs)) ⇒ (elem\ e\ xs))\
  (asumiendo\ Eq\ a)$

  ```haskell
  -- Hago inducción sobre xs. Asumo P(xs) y veo que vale P(x:xs) ∀x::a. ∀xs::[a].

  --Caso base P([])
  (elem e (filter p [])) ⇒ (elem e []) = True
  {F0} (elem e []) ⇒ (elem e []) -- en este paso para mi ya esta
  {E0} False ⇒ (elem e []) -- False implica cualquier cosa es true por lo que vale

  --Caso inductivo P(x:xs):
  (elem e (filter p (x:xs))) ⇒ (elem e (x:xs)) = True
  {F1} ((elem e (if p x then x : (filter p xs) else (filter p xs))) ⇒ (elem e x:xs))
  --Por principio de inducción sobre booleanos:
    --Caso p(x) false:
        (elem e (filter p xs)) ⇒ (elem e (x:xs))
        --Por inducción sobre booleanos:
             elem e (filter p xs) = False -->false ⇒ cualquier cosa es True
             elem e (filter p xs) = True --> no se como escribirlo bien pero vale porque si es true en xs tiene que ser true en x:xs
    -- Caso p x = True
        ((elem e (x : filter p xs)) ⇒ (elem e x:xs))
        {E1} = ((e == x | elem e (filter p xs)) ⇒ (e == x | elem e xs))

        -- Por principio de induccion sobre booleanos.

        ---- Caso e == x = True
        (True) ⇒ (True)
        {--} = True

        ---- Caso e == x = False
        ((elem e (filter p xs)) ⇒ (elem e xs))
        {HI} = True
               
  ```
  #### VI)
   reverse = foldr (\x rec -> rec ++ (x:[])) []
   ```haskell
   --Por principio de extensionalidad funcional basta ver que ∀xs::[a]
   reverse xs = foldr (\x rec -> rec ++ (x:[])) [] xs
   
   --Por inducción sobre listas:
   --Caso base P([]):
   reverse [] = foldr (\x rec -> rec ++ (x:[])) [] []
   {R0} foldl (flip (:)) []
   {FL0} []
   {FR0} foldr (\x rec -> rec ++ (x:[])) [] []

   -- Caso inductivo:  ∀x::a. ∀xs::[a]. Usando P(xs) como hipotesis inductiva, quiero ver que P(x:xs).
   reverse (x:xs) = foldr (\x rec -> rec ++ (x:[])) [] (x:xs)
   {R0} foldl (flip (:)) [] (x:xs) 
   {FL1} foldl flip (:) (flip (:) [] x) xs
   {F1} foldl flip (:) [x] xs
   -- Acá me trabé
   ```
### Ejercicio 6

#### I) Eq a => ∀ xs::[a] . ∀ e::a . ∀ p::a -> Bool . elem e xs && p e = elem e (filter p xs)
Verdadero.  
Es muy largo esto, lo dejo para mas adelante de ser necesario.


### Ejercicio 9
$∀ x::AB\ a .\ altura\ x ≤ cantNodos\ x$ 

foldAB base f Nil = base   
foldAB base f (Bin (izq) a (der)) = f a (foldAB base f izq) (foldAB base f der)

cantNodos = foldAB 0 (\_ rec1 rec2 -> 1 + rec1 + rec2)

altura = foldAB 0 (\_ rec1 rec2 -> 1 + (max rec1 rec2))

```haskell
-- Por inducción sobre árboles

--Caso base P(nil)
altura nil ≤ cantNodos nil
{A1} foldAB 0 (\_ rec1 rec2 -> 1 + (max rec1 rec2)) nil
{FAB0} 0
-- Hago el lado derecho que creo que es más simple
{C1} foldAB 0 (\_ rec1 rec2 -> 1 + rec1 + rec2) nil
{FAB0} 0
-- Son iguales por lo que vale el caso base

--Caso inductivo: vale para izq, vale para der --> ver que vale para izq r der (escribo izq r der para ayudarme con la notación)
altura bin(izq r der) ≤ cantNodos bin(izq r der)
{A1} foldAB 0 (\_ rec1 rec2 -> 1 + (max rec1 rec2)) bin(izq r der)
{FAB1} (\_ rec1 rec2 -> 1 + (max rec1 rec2)) r (foldAB 0 (\_ rec1 rec2 -> 1 + (max rec1 rec2)) izq) (foldAB 0 (\_ rec1 rec2 -> 1 + (max rec1 rec2)) der)
-- Voy a reemplazar con la HI que es mayor y si es menor igual reemplazando entonces era menor o igual
{HI} (\_ rec1 rec2 -> 1 + (max rec1 rec2)) r (foldAB 0 (\_ rec1 rec2 -> 1 + rec1 + rec2) izq) (foldAB 0 (\_ rec1 rec2 -> 1 + rec1 + rec2) der)
-- Max rec1 rec2 ≤ rec1 + rec 2 pues son positivos, entonces queda: 
(\_ rec1 rec2 -> 1 + rec1 + rec2) r (foldAB 0 (\_ rec1 rec2 -> 1 + rec1 + rec2) izq) (foldAB 0 (\_ rec1 rec2 -> 1 + rec1 + rec2) der)
{FAB1} foldAB 0 (\_ rec1 rec2 -> 1 + rec1 + rec2) bin(izq r der)
{C1} cantNodos bin(izq r der)

```
