signature UNIQUE =
sig
  type uid
  val allocate : unit -> uid
  val toInt		: uid -> int 
end

functor Unique (S: sig end) :> UNIQUE =
struct
	type uid = int
	val counter = ref 0
	fun allocate () = (counter := !counter + 1; !counter - 1)
	(*
		Alternate way
		fun allocate () = let val x = !current in current := x + 1 ; x end
	*)
	fun toInt (x : uid) = x 
end

structure A = Unique()
structure B = Unique()

val a1 = A.allocate()
val a2 = A.allocate()

val b1 = B.allocate()
val b2 = B.allocate()

(*
A.toInt a1
A.toInt a2
B.toInt b1
B.toInt b2
*)
