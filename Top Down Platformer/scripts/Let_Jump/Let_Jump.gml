function Let_Jump(){

var need_inst = noone
var need_inst2 = noone
var dis_list = ds_list_create();
var make_space = collision_rectangle_list(bbox_left-1,bbox_top-1,bbox_right+1,bbox_bottom+1,Obj_block,false,true,dis_list,true)
if (make_space > 0)
{
	for (var i = 0; i < make_space; i++) {
		need_inst = dis_list[| i];
		if (need_inst.position.z > position.z)
		{
			need_inst2 = need_inst
		}
		
	}
	
}
ds_list_destroy(dis_list)


var endX = target.x;
var endY = target.y;
var dis2 = 0;
var des_dis = 0;

var cir = collision_circle(x,y,96+1,target,false,true)

if (cir && cir.position.z_ground == position.z_ground)
{
	Length_test = -1;
	endX = target.x
	endY = target.y
	if (target.actual_jump == 0) || (dir = -1)
	{
	dis2 = min(point_distance(x,y,endX,endY),96)
	}
	else {	
	if (target.position.z_ground > 32)
	{
		des_dis = target.position.z_ground-(32+position.z_ground)
	}
	dis2 = max(32+max_spd+jump_spd,(40+(max_spd*jump_spd))-max(0,des_dis))
	}
}

else
{
	var cal_dis = round(point_distance(x,y,target.x,target.y) / 64) //- 1
	Length_test = cal_dis
	endX = path_get_point_x(path,min(cal_dis,3));
	endY = path_get_point_y(path,min(cal_dis,3));
	if point_in_circle(x,y,target_x,target_y,96)
	{
	dis2 = point_distance(x,y,target_x,target_y)//min(point_distance(x,y,target_x,target_y),96)
	}
	else {	
	if (target.position.z_ground > 32)
	{
		des_dis = target.position.z_ground-(32+position.z_ground)
	}
	dis2 = max(32+max_spd+jump_spd,(40+(max_spd*jump_spd))-max(0,des_dis))//78
	}

}
dist_ = dis2
var dir2 = point_direction(x,y,endX,endY)
xxxxx = endX
yyyyy = endY
dir_ = dir2

var coll2 = collision_point(x+lengthdir_x(-32+max_spd,dir2),y+lengthdir_y(-32+max_spd,dir2),Obj_void,false,true)
var coll3 = collision_point(x+lengthdir_x(32-max_spd,dir2),y+lengthdir_y(32-max_spd,dir2),Obj_void,false,true)

/*
var coll = collision_line_list(bbox_left-1,bbox_top-1,bbox_left-1+lengthdir_x(dis2,dir2),bbox_top-1+lengthdir_y(dis2,dir2),Obj_block,false,true,dis_list2,true)
|| collision_line_list(bbox_left-1,bbox_bottom+1,bbox_left-1+lengthdir_x(dis2,dir2),bbox_bottom+1+lengthdir_y(dis2,dir2),Obj_block,false,true,dis_list2,true)
|| collision_line_list(bbox_right+1,bbox_top-1,bbox_right+1+lengthdir_x(dis2,dir2),bbox_top-1+lengthdir_y(dis2,dir2),Obj_block,false,true,dis_list2,true)
|| collision_line_list(bbox_right+1,bbox_bottom+1,bbox_right+1+lengthdir_x(dis2,dir2),bbox_bottom+1+lengthdir_y(dis2,dir2),Obj_block,false,true,dis_list2,true)

*/
var dis_list2 = ds_list_create()
var coll = collision_line_list(x,y,x+lengthdir_x(dis2,dir2),y+lengthdir_y(dis2,dir2),Obj_block,false,true,dis_list2,true)

var point_coll = 0
if collision_point(target_x,target_y,Obj_Target,false,true)
{
point_coll = 1
}
//var inst2 = noone
if (coll > 0) 
{
for (var i = 0; i < coll; ++i) {
	var inst = dis_list2[| i];
	var pre_move = 0//position.z;
	if (inst && (inst.position.z+inst.position.z_height < position.z+jump_dis && inst.position.z < position.z+position.z_height))
	{
		pre_move = 1
	}
	
	/*if (need_inst2 == noone || need_inst == noone) && (point_coll = 0)
	{
		pre_move = max(target.position.z,position.z)
	}
	else
	{
		pre_move = position.z
	}*/
	
	var pos_z = inst.position.z_height + inst.position.z
	//&& inst.position.z <= position.z  //&& pos_z > position.z
	if(pos_z <= position.z+jump_dis && pos_z > position.z 
	//&& target.position.z_ground >= position.z
	&& pre_move == 1//&& inst2.position.z <= pre_move //|| (point_in_circle(x,y,disX,disY,max(4,max_spd+1)) && (pos_z == position.z_ground) && target.position.z_ground > position.z_ground)
	//&& (point_in_circle(target_x,target_y,target.x,target.y,max(4,max_spd+1)) || point_in_circle(x,y,disX,disY,max(4,max_spd+1))
	//)
	&& (position.z == position.z_ground) && (position.z_speed == 0)
	&& !(need_inst2 != noone && inst.position.z+inst.position.z_height >= position.z_ground 
	&& inst.position.z == position.z_ground && need_inst2.position.z <= inst.position.z+inst.position.z_height))
	{

		if(jump_count < 1){
			jump_count += 1;
			position.z_speed = jump_spd;
			variant_jump = 1;
		}
		
	}
}
}
ds_list_destroy(dis_list2)

if (coll2) && (voidAllow == 0) && (coll3)
{
	voidAllow = 1

	if(jump_count < 1){
		jump_count += 1;
		position.z_speed = jump_spd;
		variant_jump = 3;
	}
}
if (!coll2)
{
	voidAllow = 0
}

if (dir = -1) && (target_x != target.x || target_y != target.y || position.z_ground != target.position.z_ground) //&& (target_x != x && target_y != y)
&& (target.position.z > position.z) //&& (need_inst == noone || (need_inst.position.z+need_inst.position.z_height <= position.z_ground + jump_dis))
&& (position.z == position.z_ground) && (position.z_speed == 0)
{

if(jump_count < 1){
	jump_count += 1;
	position.z_speed = jump_spd;
	variant_jump = 2;
}

}

if (position.z_speed == 0) && (position.z == position.z_ground)
{
	variant_jump = 0;
	actual_jump = 0
}
else if (position.z_speed < 0)
{
	if (variant_jump != 0)
	{
	actual_jump = 1
	}
	else
	{
	actual_jump = 3
	}
}
else if (position.z_speed > 0)
{
	actual_jump = 2
}

if(abs(position.z - position.z_ground) < position.z_step) && (variant_jump == 0)
	{jump_count = 0;}
}