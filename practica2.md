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
