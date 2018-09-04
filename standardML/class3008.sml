signature MYSIG =
sig
  val y : int
end

structure A : sig	
					val y: int
					end =
struct
  val someFunnyName = 42
  val y = 56
end

structure B : MYSIG =
struct
  val y = 45
  val internal = 56
end

functor IncrementBy (S : MYSIG) =
struct
  fun inc x = x + S.y
end

structure IA = IncrementBy (A);
structure IB = IncrementBy (B);

functor IBy (val y : int) = 
struct
	fun incr x = x + y
end

val x = ref 0;

signature COUNTER =
sig
	val inc : int -> unit
	val show : unit -> int
end

structure Counter : COUNTER =
struct
  val countRef = ref 0
  fun inc x = countRef := x + !countRef
  fun show () = !countRef
end