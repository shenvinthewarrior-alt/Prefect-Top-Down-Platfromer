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

if instance_place(x,y,Obj_player) && (Obj_player.position.z >= position.z && Obj_player.position.z <= position.z+4)
{
	active = 1;
}
else
{
	active = 0;
}

image_index = active