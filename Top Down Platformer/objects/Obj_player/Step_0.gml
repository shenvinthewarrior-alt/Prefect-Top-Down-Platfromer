//Step
if keyboard_check(vk_shift)
{
	move_spd = 4
}
else
{
	move_spd = 1
}

if (position.z_speed == 0) && (position.z == position.z_ground)
{
	actual_jump = 0
}
else if (position.z_speed < 0)
{
	actual_jump = 1
}
else if (position.z_speed > 0)
{
	actual_jump = 2
}

if(state_timer > 0) state_timer--;

state();

//Depth_sorting(true);
var coll = collision_rectangle(bbox_left,bbox_top-150,bbox_right,bbox_top,Obj_block,false,true)
if (coll) && (coll.position.z+coll.position.z_height > position.z_ground)
{
	var coll2 = collision_rectangle(bbox_left,bbox_bottom+1,bbox_right,bbox_bottom+32,Obj_enemy,false,true)
	if (coll2) && (coll2.position.z_ground+coll2.position.z_height > position.z_ground)
	{
	depth = -(bbox_bottom-(position.z_height/2)+position.z)
	}
	else
	{
	depth = -(bbox_bottom+position.z)
	}
}
else
{
	var coll2 = collision_rectangle(bbox_left,bbox_bottom+1,bbox_right,bbox_bottom+32,Obj_enemy,false,true)
	if (coll2) && (coll2.position.z_ground+coll2.position.z_height > position.z_ground)
	{
	depth = -(bbox_bottom-(position.z_height/2)+position.z_ground)
	}
	else
	{
	depth = -(bbox_bottom+position.z_ground)
	}
}

if (motion.x != 0 || motion.y != 0)
{
	anim_dir = round(point_direction(x,y,x+motion.x,y+motion.y))
	if !(jump_count > 0)
	{
	if /*(max_spd < 2) ||*/ (!keyboard_check(vk_shift))
	{
	if (anim_checker != 1)
	{
		anim_checker = 1
		localFrame = 0;
	}
	sprite_moving = Spr_walk //Spri_texture_test_walk

	var car_dir = round(anim_dir/45)
	var _total_frame = sprite_get_number(sprite_moving)/8
	image_moving = localFrame + (car_dir*_total_frame)
	localFrame += sprite_get_speed(sprite_moving)/60
	
	if (localFrame >= _total_frame)
	{
		localFrame -= _total_frame
	}
	}
	
	else
	{
	if (anim_checker != 3)
	{
		anim_checker = 3
		localFrame = 0;
	}
	sprite_moving = Spr_Run//Spri_texture_test_run

	var car_dir = round(anim_dir/45)
	var _total_frame = sprite_get_number(sprite_moving)/8
	image_moving = localFrame + (car_dir*_total_frame)
	localFrame += sprite_get_speed(sprite_moving)/60
	
	if (localFrame >= _total_frame)
	{
		localFrame -= _total_frame
	}
	}
	
	}
	else
	{
		if (anim_checker != 2)
		{
			anim_checker = 2
			localFrame = 0;
		}
		sprite_moving = Spr_jump //Spri_texture_test_jump
		var car_dir = round(anim_dir/45)
		var _total_frame = sprite_get_number(sprite_moving)/8
		image_moving = localFrame + (car_dir*_total_frame)
		//localFrame += sprite_get_speed(sprite_moving)/60
		if (position.z <= position.z_ground+jump_dis-20)
		{
			if (position.z_speed > 0)
			{localFrame = 0}else{localFrame = 2}
		}
		else
		{
			if (position.z_speed > 0)
			{localFrame = 1}else{localFrame = 2}
		}
		/*if (localFrame >= _total_frame)
		{
			localFrame -= _total_frame
		}*/
	}
}
else
{
	if !(jump_count > 0)
	{
	
	if (anim_checker != 0)
	{
		anim_checker = 0
		localFrame = 0;
	}
	sprite_moving = Spr_idle
	var car_dir = round(anim_dir/45)
	var _total_frame = sprite_get_number(sprite_moving)/8
	image_moving = localFrame + (car_dir*_total_frame)
	//localFrame += sprite_get_speed(sprite_moving)/60
	
	/*if (localFrame >= _total_frame)
	{
		localFrame -= _total_frame
	}*/
	
	}
	
	else
	{
		if (anim_checker != 2)
		{
			anim_checker = 2
			localFrame = 0;
		}
		sprite_moving = Spr_jump
		var car_dir = round(anim_dir/45)
		var _total_frame = sprite_get_number(sprite_moving)/8
		image_moving = localFrame + (car_dir*_total_frame)
		//localFrame += sprite_get_speed(sprite_moving)/60
		if (position.z <= position.z_ground+jump_dis-20)
		{
			if (position.z_speed > 0)
			{localFrame = 0}else{localFrame = 2}
		}
		else
		{
			if (position.z_speed > -2)
			{localFrame = 1}else{localFrame = 2}
		}
		/*if (localFrame >= _total_frame)
		{
			localFrame -= _total_frame
		}*/
	}
	
}


if keyboard_check_pressed(ord("L"))
{
	var hitter = instance_create_depth(x,y,depth,Obj_hitbox)
	hitter.image_index = round(anim_dir/45)
}

if keyboard_check_pressed(ord("R"))
{
	instance_create_depth(room_width-16,y,depth,Obj_enemy)
}