randomise()
z_case = floor(position.z / 32);

if (ds_map_exists(global.leaders, z_case) && global.leaders[? z_case] == id)
{
    leader = true;
}
else
{
    leader = false;
}

if (leader == true)
{
	global.unique_enemy = id
}

if(state_timer > 0) state_timer--;

state();

var coll = collision_rectangle(bbox_left,bbox_top-150,bbox_right,bbox_top,Obj_block,false,true)
if (coll) && (coll.position.z+coll.position.z_height > position.z_ground)
{
	var coll2 = collision_rectangle(bbox_left,bbox_bottom+1,bbox_right,bbox_bottom+32,Obj_player,false,true)
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
	var coll2 = collision_rectangle(bbox_left,bbox_bottom+1,bbox_right,bbox_bottom+32,Obj_player,false,true)
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
	if !(max_spd >= 0.1)
	{
	if (anim_checker != "walk")
	{
		anim_checker = "walk"
		localFrame = 0;
	}
	sprite_moving = Spr_walk	

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
	if (anim_checker != "run")
	{
		anim_checker = "run"
		localFrame = 0;
	}
	sprite_moving = Spr_Run	

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
		if (anim_checker != "jump")
		{
			anim_checker = "jump"
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
else
{
	if !(jump_count > 0)
	{
	
	if (anim_checker != "idle")
	{
		anim_checker = "idle"
		localFrame = 0;
	}
	sprite_moving = Spr_idle
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
		if (anim_checker != "jump")
		{
			anim_checker = "jump"
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

var _rad = 256

if collision_check_zaxis_1(x,y,_rad,attack_target)
{
	attack_stage = true;
	attack_timer = _rad/10
}
else
{
	if (attack_timer <= 0)
	{
	attack_timer = 0;
	attack_stage = false;
	}
	else
	{
	attack_timer--;
	}
}

if (attack_stage = true)
{
	target = id
	if !keyboard_check(vk_backspace)
	{
	target_xoffset = lengthdir_x(64,dirn-(180-mis_dir) );
	target_yoffset = lengthdir_y(64,dirn-(180-mis_dir) );
	}
	else
	{
		target_xoffset = 0;
		target_yoffset = 0;
	}
	rolled_once = false
	rolled_time++;
	if (rolled_time > rolled_random)
	{
	rolled_time = 0;
	rolled_random = (Equal_prng_roll(rolled_random_create)+1)*60;
	mis_dir = (Equal_prng_roll(mis_dir_create)-3)*45
	Drin_Scr()
	}
}
else
{
	target = Obj_player
	target_xoffset = 0;
	target_yoffset = 0;
	if (rolled_once == false)
	{
	rolled_once = true
	rolled_time = 0;
	rolled_random = (Equal_prng_roll(rolled_random_create)+1)*60;
	mis_dir = (Equal_prng_roll(mis_dir_create)-3)*45
	Drin_Scr()
	}
}

