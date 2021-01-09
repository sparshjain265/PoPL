struct myType {data : String, value : u32 }

impl Drop for myType 
{
	fn drop (&mut self) 
	{
		print!("Dropping {}, {} \n", self.data, self.value);
	}
}

fn first <'a, 'b> (x: &'a Box<i32>, y: &'b Box<i32>) -> &'a Box<i32>
{
	return x;
}

fn largest <'a>(x: &'a Box<i32>, y: &'a Box<i32>) -> &'a Box<i32>
{
	if *x < *y
	{
		return y;
	}
	else
	{
		return x;
	}
}

fn main()
{
	let x = Box::new(1i32);
	let y = Box::new(2i32);
	let z = largest(&x, &y);
	let w = first(&x, &y);
	let a = myType{data:String::from("Sparsh"), value : 6};
	println!("z = {}, w = {}, a.data = {}", z, w, a.data)
}