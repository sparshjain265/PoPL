(*

Assignment 1. Due on 30th Aug Thursday by 12:00 noon.

Name:		Sparsh Jain
Rollno:	111601026

*)
datatype binop = PLUS  | MINUS | MUL | DIV
datatype uniop = UPLUS | UMINUS

datatype expr  = C of real
	       | B of binop * expr * expr
	       | U of uniop * expr

(* Your task is to write the following functions

binopDenote : binop -> real * real -> real
uniopDenote : uniop -> real -> real
exprDenote  : expr  -> real

*)

fun binopDenote PLUS (x, y) = x + y
	| binopDenote MINUS (x, y) = x - y 
	| binopDenote MUL (x, y) = x * y 
	| binopDenote DIV (x, y) = x / y

fun uniopDenote UPLUS x = x
	| uniopDenote UMINUS x = 0.0 - x 

fun exprDenote (C x) = x 
	| exprDenote (B (opr, x, y)) = binopDenote opr (exprDenote x, exprDenote y)
	| exprDenote (U (opr, x)) = uniopDenote opr (exprDenote x)

(* test case *)
val a = C(7.5)
val b = C(2.5)
(* c = ((a+b)*b)/a - -b *)
 val c = exprDenote (B(MINUS, B( DIV, B(MUL, B(PLUS, a, b), b), a), U(UMINUS, b)))