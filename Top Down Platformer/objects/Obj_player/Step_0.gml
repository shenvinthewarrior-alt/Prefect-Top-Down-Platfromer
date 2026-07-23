//Step
if keyboard_check(Obj_player_control.key[Action.RUN])
{
	move_spd = run_spd
}
else
{
	move_spd = walk_spd
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

var list = ds_list_create()
var _num = instance_place_list(x,y,Obj_block,list,false)
var cal_depth = 0;
var cal_depth1 = 1;
var cal_height = 0;
if (_num > 0)
{
    for (var i = 0; i < _num; ++i)
    {
		var coll = list[| i]
		if (coll != noone) && (coll.position.z+coll.position.z_height == position.z_ground)
		{
			cal_depth = coll.bbox_bottom+64
			cal_depth1 = coll.image_yscale;
			cal_height = (coll.position.z_height*(coll.bbox_top/64))
		}
    }
}
ds_list_destroy(list)

var cal_height1 = 0;

var list2 = ds_list_create()
var _num2 = collision_rectangle_list(bbox_left,bbox_top-150,bbox_right,bbox_top,Obj_block,false,true,list2,false)
if (_num2 > 0)
{
    for (var i = 0; i < _num2; ++i)
    {
		var coll = list2[| i]
		if (coll != noone)
		{
			
			if (coll.position.z+coll.position.z_height > position.z_ground) && (!instance_place(x,y,coll))
			{
			cal_height1 = (coll.bbox_bottom+64)+(coll.position.z_height*(coll.bbox_top/48))//+((coll.position.z_height+coll.position.z) *(coll.bbox_bottom/48))
			}
		}
    }
}
ds_list_destroy(list2)

depth = -(bbox_top+cal_depth+cal_height1+cal_height+(position.z*cal_depth1) )










if (attack == false)
{
if (motion.x != 0 || motion.y != 0)
{
	anim_dir = round(point_direction(x,y,x+motion.x,y+motion.y))
	if !(jump_count > 0)
	{
	if /*(max_spd < 2) ||*/ (!keyboard_check(vk_shift))
	{
	if (anim_checker != "walk")
	{
		anim_checker = "walk"
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
	if (anim_checker != "run")
	{
		anim_checker = "run"
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
		if (anim_checker != "jump")
		{
			anim_checker = "jump"
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
	
	if (anim_checker != "idle")
	{
		anim_checker = "idle"
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
}
else
{
	if (anim_checker != "cross punch")
	{
		anim_checker = "cross punch"
		localFrame = 0;
	}
	sprite_moving = Spr_Cross_punch //Spri_texture_test_walk

	var car_dir = round(anim_dir/45)
	var _total_frame = sprite_get_number(sprite_moving)/8
	image_moving = localFrame + (car_dir*_total_frame)
	localFrame += sprite_get_speed(sprite_moving)/60
	
	if (localFrame >= _total_frame)
	{
		attack = false
	}
	
	if (localFrame == 5) && (attack_coll == noone)
	{
		var atk = instance_create_depth(x,y,depth,Obj_hitbox)
		atk.alarm[0] = 1
		attack_coll = atk.id
	}
}

if keyboard_check_pressed(Obj_player_control.key[Action.CROSS_PUNCH]) && (attack == false)
{
	attack = true
}

	
if (attack_coll != noone) {
	if instance_exists(attack_coll) {attack_coll.x = x+(motion.x*max_spd); attack_coll.y = y+(motion.y*max_spd); attack_coll.position.z = 56+position.z+position.z_speed; attack_coll.image_index = round(anim_dir/45);}
	else {attack_coll = noone}
};