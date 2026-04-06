function Pathing(g ,n_i ,iy2 ,_x ,_y){
var exist = instance_exists(Obj_Target)
var pointer = noone
if (exist)
{pointer = point_in_circle(_x,_y,exist.x,exist.y,5)}
if (mp_grid_path(g, path, x, y, target.x+target_xoffset, target.y+target_yoffset, true) || (target.position.z_ground <= position.z+128 && target.position.z_ground >= position.z)) && (pointer == noone || target.position.z_ground == position.z)
{
pathable = 1

if (target.position.z_ground < position.z)
{

	if (actual_jump == 0 || actual_jump == 3) && (iy2 != noone && iy2.position.z >= target.position.z)
	{
		target_x = _x;
		target_y = _y;
	}
	else
	{
		target_x = target.x+target_xoffset;
		target_y = target.y+target_yoffset;
	}

}
else if (target.position.z_ground > position.z)
{

	if (n_i != noone && n_i.position.z+n_i.position.z_height >= position.z_ground)
	{
		target_x = _x;
		target_y = _y;
	}
	else
	{
		target_x = target.x+target_xoffset;
		target_y = target.y+target_yoffset;
	}

}
else if (target.position.z_ground == position.z)
{
	target_x = target.x+target_xoffset;
	target_y = target.y+target_yoffset;
}
}
else
{
	pathable = 0

	if (target.position.z_ground < position.z)
	{

		if (actual_jump == 0) || (actual_jump == 3)
		{
			target_x = _x;
			target_y = _y;
		}
		else
		{
			target_x = target.x+target_xoffset;
			target_y = target.y+target_yoffset;
		}

	}
	else if (target.position.z_ground > position.z)
	{
		var _list = ds_list_create();
		var colling = noone
		var _dis_ = 9999
		var _num = collision_rectangle_list(0,0,room_width,room_height,Obj_ladder, false, true, _list, false);
		if (_num > 0)
		{
			for (var i = 0; i < _num; ++i)
			{
			    var coll5 = _list[| i];
				var d = point_distance(x, y, coll5.x, coll5.y);
				if (coll5 != noone && coll5.position.z_height+coll5.position.z > position.z_ground)
				{
				if (d < _dis_)
				{
					_dis_ = d;
					colling = coll5
				}
				}
			}
		}
		ds_list_destroy(_list);
		
		if (colling != noone)
		{
			checked = colling
			if !point_in_rectangle(x,y,colling.x-32+lengthdir_x(32,90*colling.Dir),colling.y-64+lengthdir_y(32,90*colling.Dir),colling.x+32+lengthdir_x(32,90*colling.Dir),colling.y+lengthdir_y(32,90*colling.Dir))
			{
			target_x = colling.x+lengthdir_x(64,90*colling.Dir);
			target_y = colling.y-32+lengthdir_y(64,90*colling.Dir);
			}
			else
			{
			target_x = colling.x;
			target_y = colling.y-32;
			}
		}
		else
		{
		target_x = _x;
		target_y = _y;
		}
	}
	else if (target.position.z_ground == position.z)
	{
		target_x = _x//target.x;
		target_y = _y//target.y;
	}
}

}