function player_state_climb(){
	if (object_index == Obj_player)
	{
		motion.x = (keyboard_check(ord("D")) || keyboard_check_pressed(vk_right)) - (keyboard_check(ord("A")) || keyboard_check_pressed(vk_left));
		motion.y = (keyboard_check(ord("S")) || keyboard_check_pressed(vk_down)) - (keyboard_check(ord("W")) || keyboard_check_pressed(vk_up));
	}
	else
	{
		Finding(griding)
		motion.x = xspd
		motion.y = yspd
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
		target_x = Obj_player.x;
		target_y = Obj_player.y;
		}
	}
	
	position.z += ladder_object.acceleration
	/// no ladder, exit
	if(ladder_object < 0 || !instance_exists(ladder_object)){
		state = player_state_normal;	
		exit;
	}
	
	/// get off ladder
	if((keyboard_check_pressed(vk_space) && state_timer <= 0) 
		|| (position.z > ladder_object.position.z_top(self)) 
		|| position.z < ladder_object.position.z){
			
		position.z = max(position.z, ladder_object.position.z);
		state_timer = room_speed;
		state = player_state_normal;
		/// jump if above
		if (position.z >= ladder_object.position.z_top(self)) {
			position.z_speed = 4;
		}
		exit;
	}
	
	/// move up
	if (ladder_object.Dir == 2)
	{
	if(motion.x > 0){
		position.z += max_spd;	
	}
	
	/// move down
	if(motion.x < 0){
		position.z -= max_spd;
	}
	
	/// move to center of ladder
	var ymid = (ladder_object.bbox_top + ladder_object.bbox_bottom) * 0.5;
	y = lerp(y, ymid, 0.25);
	x = lerp(x, ladder_object.bbox_left-32, 0.25);
	}
	
	if (ladder_object.Dir == 3)
	{
	if(motion.y < 0){
		position.z += max_spd;	
	}
	
	/// move down
	if(motion.y > 0){
		position.z -= max_spd;
	}
	
	/// move to center of ladder
	var xmid = (ladder_object.bbox_left + ladder_object.bbox_right) * 0.5;
	x = lerp(x, xmid, 0.25);
	y = lerp(y, ladder_object.bbox_bottom+32, 0.25);
	}
	
	if (ladder_object.Dir == 1)
	{
	if(motion.y > 0){
		position.z += max_spd;	
	}
	
	/// move down
	if(motion.y < 0){
		position.z -= max_spd;
	}
	
	/// move to center of ladder
	var xmid = (ladder_object.bbox_left + ladder_object.bbox_right) * 0.5;
	x = lerp(x, xmid, 0.25);
	y = lerp(y, ladder_object.bbox_top-32, 0.25);
	}
	
	if (ladder_object.Dir == 0)
	{
	if(motion.x < 0){
		position.z += max_spd;	
	}
	
	/// move down
	if(motion.x > 0){
		position.z -= max_spd;
	}
	
	/// move to center of ladder
	var ymid = (ladder_object.bbox_top + ladder_object.bbox_bottom) * 0.5;
	y = lerp(y, ymid, 0.25);
	x = lerp(x, ladder_object.bbox_right+32, 0.25);
	}
	
	/// keep shadow at bottom
	position.z_ground = ladder_object.position.z;
}