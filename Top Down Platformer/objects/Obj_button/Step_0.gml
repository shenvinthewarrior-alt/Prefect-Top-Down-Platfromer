depth = -(bbox_top+position.z)

var _num = instance_place_list(x,y,Obj_block,list,false)

if (_num > 0)
{
    for (var i = 0; i < _num; ++i)
    {
		var coll = list[| i]
		if (coll != noone && coll.available_choice == available_choice)
		{
			x += coll.moveX
			y += coll.moveY
			position.z = coll.position.z+coll.position.z_height+coll.moveZ
		}
    }
}

var _num2 = collision_rectangle_list(0,0,room_width,room_height,Obj_block,false,true,list2,false)

if (_num2 > 0)
{
    for (var i = 0; i < _num2; ++i)
    {
		var coll = list2[| i]
		if (coll != noone) && (coll.active_pos == active_pos)
		{
			if (coll.active_style == 1)
			{
				if (active == 1){coll.activate = 1}
			}
			else
			{
				if (coll.disX != 0) || (coll.disY != 0) || (coll.disZ != 0)
				{
				coll.activate = active;
				}
				if (coll.active_style == 4) || 
				(coll.active_style == 5) && (coll.moveX == 0 && coll.moveY == 0 && coll.moveZ == 0)
				{
					coll.goingToStart = !active
				}
			}
		}
    }
}

if instance_place(x,y,Obj_player) && (Obj_player.position.z >= position.z && Obj_player.position.z <= position.z+4)
{
	active = 1;
}
else
{
	active = 0;
}

image_index = active