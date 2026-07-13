var ins = instance_place(x,y,Obj_enemy)

if (ins)
{
	var nearest = instance_nearest(x,y,Obj_enemy)
	with(nearest)
	{
		instance_destroy()
	}
}

instance_destroy()