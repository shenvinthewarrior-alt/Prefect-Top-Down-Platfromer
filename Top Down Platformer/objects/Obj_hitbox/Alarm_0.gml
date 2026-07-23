var ins = collision_check_zaxis_2(x,y,Obj_enemy)

if (ins)
{
	var nearest = instance_nearest(x+lengthdir_x(2,image_index*45),y+lengthdir_y(2,image_index*45),Obj_enemy)
	with(nearest)
	{
		instance_destroy()
	}
}

instance_destroy()