fun curry f x y = f(x, y)
fun uncurry f (x, y) = f x y

(* fun foo f = fn x => fn y => f(x, y) *)
