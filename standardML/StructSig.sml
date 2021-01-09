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


val a1int = A.toInt a1
val a2int = A.toInt a2
val b1itn = B.toInt b1
val b2int = B.toInt b2
(*val b3int = B.toInt a1*)