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

//if(motion.length() > 0 ){
//motion.normalize();

move_vector.x = motion.x * max_spd
move_vector.y = motion.y * max_spd

if (position.z_minimum == 0)
{
if (collision_check_zaxis(bbox_left+move_vector.x, bbox_top, bbox_right+move_vector.x, bbox_bottom, Obj_block)){
	var collX = instance_place(x+move_vector.x,y,Obj_block)
	if (collX)
	{
	
	while !(instance_place(x+sign(move_vector.x),y,Obj_block))
	{
		x += sign(move_vector.x)
	}
	move_vector.x = 0;
	if ((bbox_right < collX.bbox_left) && (motion.x < 0)) 
	{x = ceil(x/2)*2}
	if ((bbox_left > collX.bbox_right) && (motion.x > 0))
	{x = floor(x/2)*2}
	
	}
}
if (collision_check_zaxis(bbox_left, bbox_top+move_vector.y, bbox_right, bbox_bottom+move_vector.y, Obj_block)){
	var collY = instance_place(x,y+move_vector.y,Obj_block)
	if (collY)
	{
	
	while !(instance_place(x,y+sign(move_vector.y),Obj_block))
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

var pre_coll = collision_check_zaxis(bbox_left,bbox_top,bbox_right,bbox_bottom,Obj_player)
if (pre_coll)
{
	var coll = instance_place(x+(motion.x*move_spd)+sign(motion.x),y+(motion.y*move_spd)+sign(motion.y),Obj_player)
	if (coll)
	{
	var dir = point_direction(x,y,coll.x,coll.y)
	x -= lengthdir_x(coll.move_spd,dir)
	y -= lengthdir_y(coll.move_spd,dir)
	coll.x += lengthdir_x(move_spd,dir)
	coll.y += lengthdir_y(move_spd,dir)
	}
	else if instance_place(x+(motion.x*move_spd),y,Obj_player)
	{
		move_vector.x = 0;
	}
	else if instance_place(x,y+(motion.y*move_spd),Obj_player)
	{
	move_vector.y = 0;
	}
}

var pre_coll1 = collision_check_zaxis(bbox_left,bbox_top,bbox_right,bbox_bottom,Obj_enemy)
if (pre_coll1)
{
	var coll1 = instance_place(x+(motion.x*move_spd)+sign(motion.x),y+(motion.y*move_spd)+sign(motion.y),Obj_enemy)
	if (coll1)
	{
	var dir = point_direction(x,y,coll1.x,coll1.y)
	x -= lengthdir_x(coll1.move_spd,dir)
	y -= lengthdir_y(coll1.move_spd,dir)
	coll1.x += lengthdir_x(move_spd,dir)
	coll1.y += lengthdir_y(move_spd,dir)
	}
	else if instance_place(x+(motion.x*move_spd),y,Obj_enemy)
	{
		move_vector.x = 0;
	}
	else if instance_place(x,y+(motion.y*move_spd),Obj_enemy)
	{
		move_vector.y = 0;
	}
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

x += move_vector.x
y += move_vector.y

//}


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