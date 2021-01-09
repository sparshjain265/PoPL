signature UNIQUE =
sig
  type uid
  type myType
  val allocate : unit -> uid
  val toInt		: uid -> int 
end

functor Unique (S: sig end) :> UNIQUE =
struct
	type uid = int
	datatype myType = EMPTY
	val counter = ref 0
	fun allocate () = (counter := !counter + 1; !counter - 1)
	fun toInt (x : uid) = x 
end

structure Uid = Unique()

datatype 'v Monotype = BOOL
							| ARROW of 'v Monotype * 'v Monotype
							| TVAR of 'v

datatype 'v Exp = V of string
					| A of 'v Exp * 'v Exp
					| L of 'v * 'v Exp

type 'v Type = 'v list * 'v Monotype

datatype 'v Var = UserVar of 'v
					| Temp of Uid.uid

fun fresh () = Temp(Uid.allocate())

type AVar = Atom.atom Var
type SExp = AVar Exp
type AExp = Atom.atom Exp
(*val sanitize : AExp -> SExp*)


(* join : 'v Monotype Monotype -> 'v Monotype *)

fun join (TVAR x) = x
| join (ARROW (x, y)) = ARROW(join x, join y)
| join BOOL = BOOL