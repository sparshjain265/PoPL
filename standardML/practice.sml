structure Stack = struct
	type 'a stack = 'a list
	
	val empty = []
	
	fun isEmpty [] = true
		| isEmpty _ = false
		
	fun top (x::_) = x 
	
	fun pop (x::xs) = xs

	fun push x a = a::x
	
end
