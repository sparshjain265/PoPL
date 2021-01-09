struct MyType {data : u32 }

impl Drop for MyType 
{
	fn drop (&mut self) 
	{
		print!("Dropping {}\n", self.data);
	}
}

fn main()
{
	let x = MyType{data : 0};
	let z = MyType{data : 1};
	// drop(x); /* This line will result in a move from x */
	{
		let xp = &x;	/* This will give an error if the drop x above is uncommented */
		println!("using {}", xp.data)
	}
	println!("using {}", z.data);
	drop(z);
	println!("exiting")
}