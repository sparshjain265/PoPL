open SMLofNJ.Cont

val printInt = print o Int.toString

(* val a = printInt(callcc (fn K x => x) + 3)

val b = print((throw K 100)^"world") *)

val a = 3 + (callcc (fn k => 2))	(* 5 *)

val b = 3 + callcc(fn k => throw k 10 + 7) (* 13 *)

fun foo k = throw k 10 + 7	(* 7 is ignored *)

val c = 4 * callcc foo 	(* 40 *)