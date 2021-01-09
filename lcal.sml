structure LambdaExpression =
struct
datatype expr = V of Atom.atom
					| A of expr * expr
					| L of Atom.atom * expr


fun pretty (V x) = Atom.toString x
	| pretty (A (f, e)) = bracket f ^ " " ^ bracket e
	| pretty (L (x, e)) = "/" ^ Atom.toString x ^ ". " ^ pretty e
and bracket (V x) = Atom.toString x
	| bracket e		= "(" ^ pretty e ^ ")"

fun pr e = print (pretty e ^ "\n")


(* fun var x = V (Atom.atom x) *)
val var = V o Atom.atom
fun lam x e = L (Atom.atom x, e)
fun app f e = A (f, e)

fun freeVar (V x) = AtomSet.singleton x
| freeVar (A (f, e)) = AtomSet.union (freeVar f, freeVar e)
| freeVar (L (x, e)) = AtomSet.subtract (freeVar e, x)

end

