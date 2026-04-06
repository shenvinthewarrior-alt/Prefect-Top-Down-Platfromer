function Movement(){
motion.x = xspd;
motion.y = yspd;

//max_spd = move_spd
if (point_distance(x,y,target_x,target_y) <= max_spd)
{
max_spd = max(1,point_distance(x,y,target_x,target_y)/10)
}
else
{
max_spd = min(global.max_spd_cap,move_spd)
}

if (flyable == 0)
{position.z_gravity = 0.5;}
else
{position.z_gravity = 0;}

var move_vector = new Vector2();

if(motion.length() > 0 ){
motion.normalize();

move_vector.x = motion.x * max_spd
move_vector.y = motion.y * max_spd

if (position.z_minimum == 0)
{
var collX = collision_check_zaxis(bbox_left+move_vector.x, bbox_top, bbox_right+move_vector.x, bbox_bottom, Obj_block)
if (collX){
	while !(collision_check_zaxis(bbox_left+sign(move_vector.x), bbox_top, bbox_right+sign(move_vector.x), bbox_bottom, Obj_block))
	{
		x += sign(move_vector.x)
	}
	move_vector.x = 0;
	if ((bbox_right < collX.bbox_left) && (motion.x < 0)) 
	{x = ceil(x/2)*2}
	if ((bbox_left > collX.bbox_right) && (motion.x > 0))
	{x = floor(x/2)*2}
}
var collY = collision_check_zaxis(bbox_left, bbox_top+move_vector.y, bbox_right, bbox_bottom+move_vector.y, Obj_block)
if (collY){
	while !(collision_check_zaxis(bbox_left, bbox_top+sign(move_vector.y), bbox_right, bbox_bottom+sign(move_vector.y), Obj_block))
	{
		y += sign(move_vector.y)
	}
	move_vector.y = 0;
	if ((bbox_bottom < collY.bbox_top) && (motion.y < 0))
	{y = ceil(y/2)*2}
	if ((bbox_top > collY.bbox_bottom) && (motion.y > 0))
	{y = floor(y/2)*2}
}

}
else if (position.z_minimum < 0) && (position.z < 0)
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

var collX_other = collision_check_zaxis(bbox_left+move_vector.x, bbox_top, bbox_right+move_vector.x, bbox_bottom ,Obj_player)
var collX_self = collision_check_zaxis(bbox_left+move_vector.x, bbox_top, bbox_right+move_vector.x, bbox_bottom ,Obj_enemy)
if (collX_other)
{
_push_power = max_spd//max(max_spd,3);
var move_success = false;
for (var i = 0; i < abs(move_vector.x); i++) {
	var dir = sign(move_vector.x);
	if (character_can_move(dir, 0, _push_power-1, Obj_player)) {
		move_success = true;
		_push_power -= 1; // decrease push power each step
		if (_push_power <= 0) break; // stop if no push power left
	} else {
		break;
	}
}

}
else if (collX_self)
{
_push_power = max_spd//max(max_spd,3);
var move_success = false;
for (var i = 0; i < abs(move_vector.x); i++) {
	var dir = sign(move_vector.x);
	if (character_can_move(dir, 0, _push_power-1, Obj_enemy)) {
		move_success = true;
		_push_power -= 1; // decrease push power each step
		if (_push_power <= 0) break; // stop if no push power left
	} else {
		break;
	}
}

}
else
{
	x += move_vector.x
}

var collY_other = collision_check_zaxis(bbox_left, bbox_top+move_vector.y, bbox_right, bbox_bottom+move_vector.y,Obj_player)
var collY_self = collision_check_zaxis(bbox_left, bbox_top+move_vector.y, bbox_right, bbox_bottom+move_vector.y,Obj_enemy)
if (collY_other)
{
_push_power = max_spd//max(max_spd,3);
var move_success = false;
for (var i = 0; i < abs(move_vector.y); i++) {
	var dir = sign(move_vector.y);
	if (character_can_move(0, dir, _push_power-1, Obj_player)) {
		move_success = true;
		_push_power -= 1; // decrease push power each step
		if (_push_power <= 0) break; // stop if no push power left
	} else {
		break;
	}
}

}
else if (collY_self)
{
_push_power = max_spd//max(max_spd,3);
var move_success = false;
for (var i = 0; i < abs(move_vector.y); i++) {
	var dir = sign(move_vector.y);
	if (character_can_move(0, dir, _push_power-1, Obj_enemy)) {
		move_success = true;
		_push_power -= 1; // decrease push power each step
		if (_push_power <= 0) break; // stop if no push power left
	} else {
		break;
	}
}

}
else
{
	y += move_vector.y
}

}

var exist = instance_exists(Obj_player)
if (exist)
{
	if (flyable == 0)
	{
		Let_Jump()
	}
	else
	{
		target_z = Obj_player.position.z+Obj_player.position.z_height+Obj_player.jump_dis
		//position.z_speed = (keyboard_check(vk_space) - keyboard_check(vk_shift))*fly_spd
		if (target_z - position.z >= fly_spd || target_z - position.z <= -fly_spd)
		{
		position.z_speed = sign(target_z - position.z)*fly_spd
		}
		else
		{
		position.z_speed = target_z - position.z
		}
	}
}
else
{
	xspd = 0;
	yspd = 0;
}
player_ladder_test(motion);
}