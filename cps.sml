open SMLofNJ.Cont

(*
val a = 3 + (callcc (fn k => 2))	(* 5 *)

val b = 3 + callcc(fn k => throw k 10 + 7) (* 13 *)

fun foo k = throw k 10 + 7	(* 7 is ignored *)

val c = 4 * callcc foo 	(* 40 *)

(*
val k = isolate(fn x => print(Int.toString x))
*)

*)

val printInt = print o Int.toString
val printK = isolate printInt
val icRef = ref printK
fun save x = callcc (fn k => (icRef := k; x))