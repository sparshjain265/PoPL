fun head (x::xs) = x

val myList = [1,2,3]

val something = head myList

fun foo x = 2*x

fun isempty (_::_) = false | isempty _ = true

fun len (x::xs) = 1 + len xs | len _			 = 0

fun sum (x::xs) = x + sum xs | sum _ = 0

fun fst (a, b) = a

fun snd (a, b) = b
 
fun map (f, []) = [] | map (f, x::xs) = (f x :: map (f, xs))

val myTuple = ("Sparsh", "Patrick")

(*  #1 myTuple (* returns the 1st element of myTuple *) *)

fun plus1 x y = x + y
fun plus2 x = fn y => x + y
val plus3 = fn x => fn y => x + y

val incr = fn x => x + 1

(*
	fun f x y z u = ...
	fun f x y z = fn u => ...
	.
	. (* all of these mean essentially the same thing *)
	.
	val f = fn x => fn y => fn z => fn u => ...
*)

val myInc = plus1 1

















