function player_function(){
	update_zaxis(Obj_block);
	if instance_place(x-64,y,Obj_void) && instance_place(x,y-64,Obj_void)
	&& instance_place(x+64,y,Obj_void) && instance_place(x,y+64,Obj_void)
	{
		position.z_minimum = -256
	}
	else {
		position.z_minimum = 0;
	}
	if (position.z <= -160)
	{
		instance_destroy()
	}
	
	motion.x = keyboard_check(Obj_player_control.key[Action.GO_RIGHT]) - keyboard_check(Obj_player_control.key[Action.GO_LEFT]);
	motion.y = keyboard_check(Obj_player_control.key[Action.GO_DOWN]) - keyboard_check(Obj_player_control.key[Action.GO_UP]);

	max_spd = move_spd
	
	if (flyable == 0)
	{position.z_gravity = 0.5;}
	else
	{position.z_gravity = 0;}
	
	var move_vector = new Vector2();
	
	//if(motion.length() > 0 ) || (accr_xspd != 0 || accr_yspd != 0) {
	
	    //motion.normalize();
		
		var x_target_spd = motion.x * max_spd;
		var y_target_spd = motion.y * max_spd;
	
		if (motion.x != 0){accr_xspd = lerp(accr_xspd, x_target_spd, 0.5);}
		else{accr_xspd = lerp(accr_xspd, 0, 0.5);}
		if (motion.y != 0){accr_yspd = lerp(accr_yspd, y_target_spd, 0.5);}
		else{accr_yspd = lerp(accr_yspd, 0, 0.5);}
	
		if (abs(accr_xspd) < 0.01) accr_xspd = 0;
		if (abs(accr_yspd) < 0.01) accr_yspd = 0;
		
		move_vector.x = accr_xspd
		move_vector.y = accr_yspd
		
		if (position.z_minimum == 0)
		{
		var collX = collision_check_zaxis(bbox_left+move_vector.x, bbox_top, bbox_right+move_vector.x, bbox_bottom , Obj_block)
		if (collX){
			while !(collision_check_zaxis(bbox_left+sign(move_vector.x), bbox_top, bbox_right+sign(move_vector.x), bbox_bottom, Obj_block))
			{
				x += sign(move_vector.x)
			}
			move_vector.x = 0;
			if ((bbox_right < collX.bbox_left) && (motion.x < 0)) 
			{
				x = ceil(x/2)*2
			}
			if ((bbox_left > collX.bbox_right) && (motion.x > 0))
			{
				x = floor(x/2)*2
			}
		}
		var collY = collision_check_zaxis(bbox_left, bbox_top+move_vector.y, bbox_right, bbox_bottom+move_vector.y, Obj_block)
		if (collY){
			while !(collision_check_zaxis(bbox_left, bbox_top+sign(move_vector.y), bbox_right, bbox_bottom+sign(move_vector.y), Obj_block))
			{
				y += sign(move_vector.y)
			}
			move_vector.y = 0;
			if ((bbox_bottom < collY.bbox_top) && (motion.y < 0))
			{
				y = ceil(y/2)*2
			}
			if ((bbox_top > collY.bbox_bottom) && (motion.y > 0))
			{
				y = floor(y/2)*2
			}
		}
		
		var pre_coll = collision_check_zaxis(bbox_left+(motion.x*move_spd)+sign(motion.x),bbox_top+(motion.y*move_spd)+sign(motion.y),bbox_right+(motion.x*move_spd)+sign(motion.x),bbox_bottom+(motion.y*move_spd)+sign(motion.y),Obj_player)
		if (pre_coll)
		{
			var coll = instance_place(x+(motion.x*move_spd)+sign(motion.x),y+(motion.y*move_spd)+sign(motion.y),Obj_player)
			var collt1 = instance_place(x+(coll.motion.x*coll.move_spd)+sign(coll.motion.x),y+(coll.motion.y*coll.move_spd)+sign(coll.motion.y),Obj_block)
			var collt2 = instance_place(coll.x+(motion.x*move_spd)+sign(motion.x),coll.y+(motion.y*move_spd)+sign(motion.y),Obj_block)
			if (coll) && (!collt1 && !collt2)
			{
				var dir = point_direction(x,y,coll.x,coll.y)
				x -= lengthdir_x(coll.move_spd,dir)
				y -= lengthdir_y(coll.move_spd,dir)
				coll.x += lengthdir_x(move_spd,dir)
				coll.y += lengthdir_y(move_spd,dir)
			}
			else if (coll) && (collt1)
			{
				var collxx = instance_place(x+(motion.x*move_spd),y,Obj_player)
				var collyy = instance_place(x,y+(motion.y*move_spd),Obj_player)
				if (collxx) && (collxx.move_spd > move_spd)
				{
					move_vector.x = 0;
				}
				if (collyy) && (collyy.move_spd > move_spd)
				{
					move_vector.y = 0;
				}
			}
			else
			{
				if instance_place(x+(motion.x*move_spd),y,Obj_player)
				{
					move_vector.x = 0;
				}
				if instance_place(x,y+(motion.y*move_spd),Obj_player)
				{
					move_vector.y = 0;
				}
			}
		}

		var pre_coll1 = collision_check_zaxis(bbox_left+(motion.x*move_spd)+sign(motion.x),bbox_top+(motion.y*move_spd)+sign(motion.y),bbox_right+(motion.x*move_spd)+sign(motion.x),bbox_bottom+(motion.y*move_spd)+sign(motion.y),Obj_enemy)
		if (pre_coll1)
		{
			var coll = instance_place(x+(motion.x*move_spd)+sign(motion.x),y+(motion.y*move_spd)+sign(motion.y),Obj_enemy)
			var collt1 = instance_place(x+(coll.motion.x*coll.move_spd)+sign(coll.motion.x),y+(coll.motion.y*coll.move_spd)+sign(coll.motion.y),Obj_block)
			var collt2 = instance_place(coll.x+(motion.x*move_spd)+sign(motion.x),coll.y+(motion.y*move_spd)+sign(motion.y),Obj_block)
			if (coll) && (!collt1 && !collt2)
			{
				var dir = point_direction(x,y,coll.x,coll.y)
				x -= lengthdir_x(coll.move_spd,dir)
				y -= lengthdir_y(coll.move_spd,dir)
				coll.x += lengthdir_x(move_spd,dir)
				coll.y += lengthdir_y(move_spd,dir)
			}
			else if (coll) && (collt1)
			{
				var collxx = instance_place(x+(motion.x*move_spd),y,Obj_enemy)
				var collyy = instance_place(x,y+(motion.y*move_spd),Obj_enemy)
				if (collxx) && (collxx.move_spd > move_spd)
				{
					move_vector.x = 0;
				}
				if (collyy) && (collyy.move_spd > move_spd)
				{
					move_vector.y = 0;
				}
			}
			else
			{
				if instance_place(x+(motion.x*move_spd),y,Obj_enemy)
				{
					move_vector.x = 0;
				}
				if instance_place(x,y+(motion.y*move_spd),Obj_enemy)
				{
					move_vector.y = 0;
				}
			}
		}
		
		var pre_coll2 = collision_check_zaxis(bbox_left,bbox_top,bbox_right,bbox_bottom,Obj_block)
		if (pre_coll2)
		{
			var coll = instance_place(x,y,Obj_block)
			if (coll) && (position.z+position.z_height > coll.position.z)
			{
				var dir = point_direction(x,y,coll.x,coll.y)
				x -= lengthdir_x(_push_power,dir)
				y -= lengthdir_y(_push_power,dir)
				_push_power += 1
			}
			else
			{
				_push_power = 10
			}
		}
		else
		{
			_push_power = 10
		}
		
		}
		else if (position.z_minimum < 0) && (position.z <= 0)
		{
			if !collision_rectangle(bbox_left+move_vector.x,bbox_top,bbox_left+(64*motion.x),bbox_bottom,Obj_void,false,true)
			{
				move_vector.x = 0;
			}
			if !collision_rectangle(bbox_right+move_vector.x,bbox_top,bbox_right+(64*motion.x),bbox_bottom,Obj_void,false,true)
			{
				move_vector.x = 0;
			}
			if !collision_rectangle(bbox_left,bbox_top+move_vector.y,bbox_right,bbox_top+(64*motion.y),Obj_void,false,true)
			{
				move_vector.y = 0;
			}
			if !collision_rectangle(bbox_left,bbox_bottom+move_vector.y,bbox_right,bbox_bottom+(64*motion.y),Obj_void,false,true)
			{
				move_vector.y = 0;
			}
		}
		
	    x += move_vector.x;
	    y += move_vector.y;
	//}

	if (flyable == 0)
	{
		if(abs(position.z - position.z_ground) < position.z_step)
		{jump_count = 0;}
	
		if (keyboard_check_pressed(Obj_player_control.key[Action.JUMP]) && jump_count < 1)
		{jump_count += 1;
		/*if !(jump_count > 1){*/
		position.z_speed = jump_spd;
		/*}else{position.z_speed = (jump_spd/1.6)}*/}
		
		if (position.z_speed == 0) && (position.z == position.z_ground)
		{actual_jump = 0}
		else if (position.z_speed < 0)
		{actual_jump = 1}
		else if (position.z_speed > 0)
		{actual_jump = 2}
	}
	else
	{
		position.z_speed = (keyboard_check(vk_space) - keyboard_check(vk_shift))*fly_spd
	}
	
	player_ladder_test(motion);
}