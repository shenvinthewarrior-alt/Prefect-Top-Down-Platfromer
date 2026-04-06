function Distance(n_i, _x, _y){
var dis = 0;
var pre_z3 = 0
if (actual_jump == 3){pre_z3 = position.z}else{pre_z3 = position.z_ground}
var pre_z4 = 0
if (actual_jump == 3){pre_z4 = position.z_ground}else{pre_z4 = position.z}
				
if (stop_gamble == false)
{
	gamble = irandom_range(0,1)
	stop_gamble = true
}
				
if (pre_z3 == position.z_ground) //&& (n_i != noone)
{
	if (n_i != noone)
	{
				
	var check_listL = ds_list_create()
	var check_collL = collision_rectangle_list(n_i.bbox_left-2,n_i.bbox_top,n_i.bbox_left-1,n_i.bbox_bottom,Obj_block,false,true,check_listL,false)
	var check_listR = ds_list_create()
	var check_collR = collision_rectangle_list(n_i.bbox_right+1,n_i.bbox_top,n_i.bbox_right+2,n_i.bbox_bottom,Obj_block,false,true,check_listR,false)
	var check_listU = ds_list_create()
	var check_collU = collision_rectangle_list(n_i.bbox_left,n_i.bbox_top-2,n_i.bbox_right,n_i.bbox_top-1,Obj_block,false,true,check_listU,false)
	var check_listD = ds_list_create()
	var check_collD = collision_rectangle_list(n_i.bbox_left,n_i.bbox_bottom+1,n_i.bbox_right,n_i.bbox_bottom+2,Obj_block,false,true,check_listD,false)
			
	var checkL = noone
	var checkR = noone
	var checkU = noone
	var checkD = noone
	var checkL2 = noone
	var checkR2 = noone
	var checkU2 = noone
	var checkD2 = noone
				
	var xxx = 0;
	var yyy = 0;
				
	if (check_collL > 0)
	{
		for (var Q = 0; Q < check_collL; Q++)
		{
		checkL2 = check_listL[| Q];
		}		
		if (n_i.position.z == checkL2.position.z + checkL2.position.z_height)
		{
			checkL = checkL2
		}
	}
	ds_list_destroy(check_listL)
	if (check_collR > 0)
	{
		for (var Q = 0; Q < check_collR; Q++)
		{
		checkR2 = check_listR[| Q];
		}		
		if (n_i.position.z == checkR2.position.z + checkR2.position.z_height)
		{
			checkR = checkR2
		}
	}
	ds_list_destroy(check_listR)
	if (check_collU > 0)
	{
		for (var Q = 0; Q < check_collU; Q++)
		{
		checkU2 = check_listU[| Q];
		}		
		if (n_i.position.z == checkU2.position.z + checkU2.position.z_height)
		{
			checkU = checkU2
		}
	}
	ds_list_destroy(check_listU)
	if (check_collD > 0)
	{
		for (var Q = 0; Q < check_collD; Q++)
		{
		checkD2 = check_listD[| Q];
		}		
		if (n_i.position.z == checkD2.position.z + checkD2.position.z_height)
		{
			checkD = checkD2
		}
	}
	ds_list_destroy(check_listD)
	
	if (checkL != noone)
	{
		xxx = 1
	}
	else if (checkR != noone)
	{
		xxx = -1
	}
	else if (checkL != noone) && (checkR != noone)
	{
		xxx = 0
	}
				
	if (checkU != noone)
	{
		yyy = 1
	}
	else if (checkD != noone)
	{
		yyy = -1
	}
	else if (checkU != noone) && (checkD != noone)
	{
		yyy = 0
	}
	dis = point_distance(_x, _y, Obj_player.x, Obj_player.y)	
	if (checkU != noone && checkD != noone)
	{
		check_inst = 1
		dis = point_distance(_x, _y,n_i.x+xxx,n_i.y+round((Obj_player.y-n_i.y)/64)*64)
	}
	else if (checkL != noone && checkR != noone)
	{
		check_inst = 2
		dis = point_distance(_x, _y,n_i.x+round((Obj_player.x-n_i.x)/64)*64,n_i.y+yyy)
	}
	else if ((checkL != noone && checkR == noone) || (checkL == noone && checkR != noone)) && 
	((checkU != noone && checkD == noone) || (checkU == noone && checkD != noone))
	{
		check_inst = 3
		if (gamble = 0)
		{
			dis = point_distance(_x, _y,n_i.x+round((Obj_player.x-n_i.x)/64)*64,n_i.y+yyy)
		}
		else
		{
			dis = point_distance(_x, _y,n_i.x+xxx,n_i.y+round((Obj_player.y-n_i.y)/64)*64)
		}
	}
	else
	{
		check_inst = 4
		if (n_i.position.z < position.z_ground)
		{
		dis = point_distance(_x, _y,n_i.x+round((Obj_player.x-n_i.x)/64)*64,n_i.y+round((Obj_player.y-n_i.y)/64)*64)
		}
		else
		{
		dis = point_distance(_x, _y, Obj_player.x, Obj_player.y)
		}
	}
				
	//ds_list_destroy(check_listL)
	//ds_list_destroy(check_listR)
	//ds_list_destroy(check_listU)
	//ds_list_destroy(check_listD)
	}
	else //if (position.z == position.z_ground)
	{
		check_inst = 5
		dis = point_distance(_x, _y, Obj_player.x, Obj_player.y)
		stop_gamble = false
	}
}
//else
//{
//check_inst = 6
//if (pre_z4 == position.z_ground)
//{
//	dis = point_distance(_x, _y, Obj_player.x, Obj_player.y)
//	stop_gamble = false
//}
//else
//{
//	dis = 0
//	stop_gamble = false
//}
//}

return dis;
}