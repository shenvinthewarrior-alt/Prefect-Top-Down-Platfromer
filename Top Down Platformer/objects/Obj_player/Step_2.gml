//End_step
/*zaxis_collision_handler(Obj_block)
/*var get_stuck = collision_check_zaxis(bbox_left, bbox_top, bbox_right, bbox_bottom, Obj_enemy)
if (get_stuck)
{
	var squad = instance_place(x,y,Obj_enemy)
	if (squad && squad.position.z > position.z)
	{
	x = -99999999
	}
}

var squad2 = collision_check_zaxis(bbox_left, bbox_top, bbox_right, bbox_bottom, Obj_block)
if (squad2)
{
	x = -99999999
}