(* signature S =
sig
  type t
  val toString : t -> string
  val toT : string -> t
end

structure A : S =
struct
  type t = int
  val toString = Int.toString
  fun toT x = 1
end

structure B:>S =
struct
  type t = string
  val toString = fn x => x
  fun toT x:string = x
end *)
(* 
datatype 'a tree = Empty
	| node of 'a * 'a tree list

fun map f [] = []
	| map f (x::xs) = f x :: map f xs

fun treemap f Empty = Empty
	| treemap f (node(x, l)) = node(f x, map (treemap f) l) *)

signature S =
sig
  val t : int
end

structure myS : S =
struct
  val t = 10
  val q = 20
end