function enemy_function(){
randomize()
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
	
/*if (point_distance(x,y,target_x,target_y) <= max_spd)
{
max_spd = max(1,point_distance(x,y,target_x,target_y)/10)
}
else
{
max_spd = min(global.max_spd_cap,move_spd)
}*/
	
position.z_gravity = 0.5;
//Obj_grid Draw start
var need_inst = noone
var need_inst2 = noone
var need_inst3 = noone

var make_list = ds_list_create()
var make_space = collision_rectangle_list(bbox_left-1, bbox_top-1,bbox_right+1, bbox_bottom+1, Obj_block, false, true, make_list, false);
var inst1 = noone
if (make_space > 0) {
	for (var i = 0; i < make_space; i++) {
		inst1 = make_list[| i];
		if (inst1.position.z >= position.z)
		{
			need_inst3 = inst1;
		}
		if (inst1.position.z+inst1.position.z_height >= position.z)
		{
			need_inst = inst1;
		}
		if (inst1.position.z+inst1.position.z_height > position.z)
		{
			need_inst2 = inst1;
		}
	}
}
ds_list_destroy(make_list)

var inst3 = noone
var make_list2 = ds_list_create()
var make_space2 = collision_rectangle_list(target.bbox_left, target.bbox_top, target.bbox_right, target.bbox_bottom, Obj_block, false, true, make_list2, false);
if (make_space2 > 0)
{	
	for (var d = 0; d < make_space2; d++) {
		var inst2 = make_list2[| d];
		if (inst2.position.z > target.position.z)
		{
			inst3 = inst2
		}
	}
}
ds_list_destroy(make_list2)
// Obj_grid Draw stop
var point_coll = 0
if collision_point(target_x,target_y,Obj_Target,false,true)
{point_coll = 1}

var z_band = floor(position.z / global.z_band_size);
var jump_index = array_get_index(global.jump_types,jump_dis)


if (jump_index != -1) && (position.z >= 0){
	
globalvar griding; griding = global.grid[z_band][jump_index];
	
var exist = instance_exists(target)
if (exist)
{
	var opener = 0;
	var bottom_require = 0;
	var bottom_require1 = 0;
	var pre_z7 = 0;
	if (instance_exists(Obj_block)) {pre_z7 = position.z} else {pre_z7 = position.z_ground}
	if mp_grid_path(griding, path, x, y, target.x+target_xoffset, target.y+target_yoffset, true) && 
	(target.position.z_ground == pre_z7) &&  (point_coll == 0)
	{
		opener = "go to player";
		target_x = target.x+target_xoffset
		target_y = target.y+target_yoffset
	}
	else
	{
//Obj_grid Draw resume
	var nearest_dist = room_width * room_height;
	//var nearest_dist2 = room_width * room_height;
	var nearest_x = x;
	var nearest_y = y;
	//var nearest_x2 = x;
	//var nearest_y2 = y;
		
	var blocked = noone
	var block_check = ds_list_create()
	var coll = collision_rectangle_list(0,0,room_width,room_height,Obj_block,false,true,block_check,false)
	if (coll > 0)
	{
	for (var c = 0; c < coll; c++)
	{
	blocked = block_check[| c];
	for (var j = 0; j <= (blocked.sprite_height div 64) + 1 && blocked.position.z_height <= 160 && leader == true; j++) {
	for (var k = 0; k <= (blocked.sprite_width div 64) + 1 && blocked.position.z_height <= 160 && leader == true; k++) {
	var _xx = blocked.bbox_left- 32 + (64 * k);
	var _yy = blocked.bbox_top- 32 + (64 * j);
	var _dist = Distance(need_inst, _xx, _yy);
	//point_distance(_xx, _yy, target.x, target.y);
	var _dist2 = point_distance(x, y, _xx, _yy) ;
	
	var list = ds_list_create()
	var count = collision_point_list(_xx, _yy, Obj_block, false, true, list, false);
	var list2 = ds_list_create()
	var count2 = collision_point_list(_xx, _yy, Obj_Target, false, true, list2, false);
	
	//          LT
	var listLT = ds_list_create()
	var countLT = 
	collision_rectangle_list(blocked.bbox_right+64,blocked.bbox_top,blocked.bbox_right,blocked.bbox_top+64,Obj_block, false, true, listLT, false)
	//          LD
	var listLD = ds_list_create()
	var countLD = 
	collision_rectangle_list(blocked.bbox_right+64,blocked.bbox_bottom,blocked.bbox_right,blocked.bbox_bottom-64,Obj_block, false, true, listLD, false)
	//          RT
	var listRT = ds_list_create()
	var countRT = 
	collision_rectangle_list(blocked.bbox_left,blocked.bbox_top,blocked.bbox_left-64,blocked.bbox_top+64,Obj_block, false, true, listRT, false)
	//          RD
	var listRD = ds_list_create()
	var countRD = 
	collision_rectangle_list(blocked.bbox_left,blocked.bbox_bottom,blocked.bbox_left-64,blocked.bbox_bottom-64,Obj_block, false, true, listRD, false)
				
	//          TR
	var listTR = ds_list_create()
	var countTR = 
	collision_rectangle_list(blocked.bbox_right-64,blocked.bbox_top-64,blocked.bbox_right,blocked.bbox_top,Obj_block, false, true, listTR, false)
	//          TL
	var listTL = ds_list_create()
	var countTL = 
	collision_rectangle_list(blocked.bbox_left+64,blocked.bbox_top-64,blocked.bbox_left,blocked.bbox_top,Obj_block, false, true, listTL, false)
	//          DR
	var listDR = ds_list_create()
	var countDR = 
	collision_rectangle_list(blocked.bbox_right-64,blocked.bbox_bottom,blocked.bbox_right,blocked.bbox_bottom+64,Obj_block, false, true, listDR, false)
	//          DL
	var listDL = ds_list_create()
	var countDL = 
	collision_rectangle_list(blocked.bbox_left+64,blocked.bbox_bottom,blocked.bbox_left,blocked.bbox_bottom+64,Obj_block, false, true, listDL, false)
				
	var listL = ds_list_create()
	var countL = 
	collision_rectangle_list(blocked.bbox_right+64,blocked.bbox_top,blocked.bbox_right,blocked.bbox_bottom,Obj_block, false, true,listL,false)
	var listR = ds_list_create()
	var countR = 
	collision_rectangle_list(blocked.bbox_left,blocked.bbox_top,blocked.bbox_left-64,blocked.bbox_bottom,Obj_block, false, true,listR,false)
	var listT = ds_list_create()
	var countT = 
	collision_rectangle_list(blocked.bbox_left,blocked.bbox_top-64,blocked.bbox_right,blocked.bbox_top,Obj_block, false, true,listT,false)
	var listD = ds_list_create()
	var countD = 
	collision_rectangle_list(blocked.bbox_left,blocked.bbox_bottom,blocked.bbox_right,blocked.bbox_bottom+64,Obj_block, false, true,listD, false)
	
	var avoidLT = noone
	var avoidLD = noone
	var avoidRT = noone
	var avoidRD = noone
	var avoidTR = noone
	var avoidTL = noone
	var avoidDR = noone
	var avoidDL = noone
	
	var avoidL = noone
	var avoidR = noone
	var avoidT = noone
	var avoidD = noone
	var avoidL3 = noone
	var avoidR3 = noone
	var avoidT3 = noone
	var avoidD3 = noone
	var avoidL4 = noone
	var avoidR4 = noone
	var avoidT4 = noone
	var avoidD4 = noone
	
	if (countL > 0)
	{
		for (var b = 0; b < countL; b++) {
			var avoidL2 = listL[| b];
			var pos_count = 0
			if (avoidL2.position.z+avoidL2.position.z_height <= position.z-32)
			{pos_count = 0}else{pos_count = 64}
			if (position.z-(avoidL2.position.z+avoidL2.position.z_height) <= pos_count)
			{
				avoidL = avoidL2
			}
			if (position.z < avoidL2.position.z+avoidL2.position.z_height)
			{
				avoidL3 = avoidL2
			}
			if (position.z >= avoidL2.position.z)
			{
				avoidL4 = avoidL2
			}
		}

	}
	ds_list_destroy(listL)
	if (countR > 0)
	{
		for (var b = 0; b < countR; b++) {
			var avoidR2 = listR[| b];
			var pos_count = 0
			if (avoidR2.position.z+avoidR2.position.z_height <= position.z-32)
			{pos_count = 0}else{pos_count = 64}
			if (position.z-(avoidR2.position.z+avoidR2.position.z_height) <= pos_count)
			{
				avoidR = avoidR2
			}
			if (position.z < avoidR2.position.z+avoidR2.position.z_height)
			{
				avoidR3 = avoidR2
			}
			if (position.z >= avoidR2.position.z)
			{
				avoidR4 = avoidR2
			}
		}
	}
	ds_list_destroy(listR)
	if (countT > 0)
	{
		for (var b = 0; b < countT; b++) {
			var avoidT2 = listT[| b];
			var pos_count = 0
			if (avoidT2.position.z+avoidT2.position.z_height <= position.z-32)
			{pos_count = 0}else{pos_count = 64}
			if (position.z-(avoidT2.position.z+avoidT2.position.z_height) <= pos_count)
			{
				avoidT = avoidT2
			}
			if (position.z < avoidT2.position.z+avoidT2.position.z_height)
			{
				avoidT3 = avoidT2
			}
			if (position.z >= avoidT2.position.z)
			{
				avoidT4 = avoidT2
			}
		}
	}
	ds_list_destroy(listT)
	if (countD > 0)
	{
		for (var b = 0; b < countD; b++) {
			var avoidD2 = listD[| b];
			var pos_count = 0
			if (avoidD2.position.z+avoidD2.position.z_height <= position.z-32)
			{pos_count = 0}else{pos_count = 64}
			if (position.z-(avoidD2.position.z+avoidD2.position.z_height) <= pos_count)
			{
				avoidD = avoidD2
			}
			if (position.z < avoidD2.position.z+avoidD2.position.z_height)
			{
				avoidD3 = avoidD2
			}
			if (position.z >= avoidD2.position.z)
			{
				avoidD4 = avoidD2
			}
		}
	}
	ds_list_destroy(listD)
	
	if (countLT > 0)
	{avoidLT = listLT[| 0];}
	ds_list_destroy(listLT)
	if (countLD > 0)
	{avoidLD = listLD[| 0];}
	ds_list_destroy(listLD)
	if (countRT > 0)
	{avoidRT = listRT[| 0];}
	ds_list_destroy(listRT)
	if (countRD > 0)
	{avoidRD = listRD[| 0];}
	ds_list_destroy(listRD)
	if (countTR > 0)
	{avoidTR = listTR[| 0];}
	ds_list_destroy(listTR)
	if (countTL > 0)
	{avoidTL = listTL[| 0];}
	ds_list_destroy(listTL)
	if (countDR > 0)
	{avoidDR = listDR[| 0];}
	ds_list_destroy(listDR)
	if (countDL > 0)
	{avoidDL = listDL[| 0];}
	ds_list_destroy(listDL)
	
	var inst2 = noone
	if (count2 > 0)
	{for (var a = 0; a < count2; a++) {inst2 = list2[| a];}}
	ds_list_destroy(list2)
		
	if (count == 0) 
	{
		//var pointer = collision_circle(target_x,target_y,3,Obj_Target,false,true)
		if Collision(blocked,avoidLT,avoidLD,avoidRT,avoidRD,avoidTR,avoidTL,avoidDR,avoidDL, _xx ,_yy/*, inst3*/) //&& (checker != "crawl mode")
		{
			if (mp_grid_path(griding, path, x, y, _xx, _yy, true) && (_dist < nearest_dist && _dist != 0))
			{
				opener = "Simple obstacles";
				nearest_dist = _dist;
				nearest_x = _xx;
				nearest_y = _yy;
			}
			/*if (mp_grid_path(griding, path, x, y, _xx, _yy, true) && (_dist2 < nearest_dist2))
			{
				nearest_dist2 = _dist2;
				nearest_x2 = _xx;
				nearest_y2 = _yy;
			}*/
		}
	}
	
	else if (count > 0)
	{
		if (pathable == 0)
		{
			if (inst2 != noone)
			{
			var pre_z11 = position.z_ground
			if (actual_jump == 3) {pre_z11 = position.z} else {pre_z11 = position.z_ground}
			var pre_z12 = position.z_ground
			if (actual_jump != 3) {pre_z12 = position.z} else {pre_z12 = position.z_ground}
			
			if (inst2.min_z < pre_z11 && inst2.max_z >= pre_z11 && target.position.z_ground < pre_z11)
			|| (inst2.min_z <= pre_z12 && inst2.max_z > pre_z12 && target.position.z_ground > pre_z12)
			{
				if (mp_grid_path(griding, path, x, y, _xx, _yy, true) && (_dist < nearest_dist && _dist != 0))
				{
					opener = "room mode";
					nearest_dist = _dist;
					nearest_x = _xx;
					nearest_y = _yy;
				}
				/*if (mp_grid_path(griding, path, x, y, _xx, _yy, true) && (_dist2 < nearest_dist2))
				{
					nearest_dist2 = _dist2;
					nearest_x = _xx;
					nearest_y = _yy;
				}*/
			}
			}
		}
		else if (pathable == 1)
		{
			var _zz = 0
			var _zzL = 0
			var _zzR = 0
			var _zzT = 0
			var _zzD = 0
			
			var cg = point_in_rectangle(_xx,_yy,blocked.bbox_left,blocked.bbox_top,blocked.bbox_right,blocked.bbox_bottom)
			if (cg){_zz = blocked.position.z+blocked.position.z_height}
			var cgL = point_in_rectangle(_xx,_yy,blocked.bbox_right,blocked.bbox_top,blocked.bbox_right+64,blocked.bbox_bottom)
			if (avoidL != noone) && (cgL){_zzL = avoidL.position.z+avoidL.position.z_height}
			var cgR = point_in_rectangle(_xx,_yy,blocked.bbox_left-64,blocked.bbox_top,blocked.bbox_left,blocked.bbox_bottom)
			if (avoidR != noone) && (cgR){_zzR = avoidR.position.z+avoidR.position.z_height}
			var cgT = point_in_rectangle(_xx,_yy,blocked.bbox_left,blocked.bbox_top-64,blocked.bbox_right,blocked.bbox_top)
			if (avoidT != noone) && (cgT){_zzT = avoidT.position.z+avoidT.position.z_height}
			var cgD = point_in_rectangle(_xx,_yy,blocked.bbox_left,blocked.bbox_bottom,blocked.bbox_right,blocked.bbox_bottom+64)
			if (avoidD != noone) && (cgD){_zzD = avoidD.position.z+avoidD.position.z_height}
			
			if (target.position.z_ground >= position.z)
			{
			if (Corner(_xx ,_yy ,blocked ,avoidLT ,avoidLD ,avoidRT ,avoidRD ,avoidTR ,avoidTL ,avoidDR ,avoidDL)) && 
			Jump_over(avoidL,avoidR,avoidT,avoidD,_zzL,_zzR,_zzT,_zzD,blocked,_zz,_xx,_yy,avoidL3,avoidR3,avoidT3,avoidD3,avoidL4,avoidR4,avoidT4,avoidD4,countL,countR,countT,countD)
			{
				if (mp_grid_path(griding, path, x, y, _xx, _yy, true) && (_dist < nearest_dist && _dist != 0))
				{
					opener = "jump mode";
					nearest_dist = _dist;
					nearest_x = _xx;
					nearest_y = _yy;
				}
				/*if (mp_grid_path(griding, path, x, y, _xx, _yy, true) && (_dist2 < nearest_dist2))
				{
					nearest_dist2 = _dist2;
					nearest_x2 = _xx;
					nearest_y2 = _yy;
				}*/
			}
				
			}
					
			else if (target.position.z_ground < position.z)
			{
				if sneak_crawl(count,_xx,_yy,inst3,need_inst3)
				{
					if (mp_grid_path(griding, path, x, y, _xx, _yy, true) && (_dist < nearest_dist && _dist != 0))
					{
						opener = "crawl mode";
						nearest_dist = _dist;
						nearest_x = _xx;
						nearest_y = _yy;
					}
					/*if (mp_grid_path(griding, path, x, y, _xx, _yy, true) && (_dist2 < nearest_dist2))
					{
						nearest_dist2 = _dist2;
						nearest_x2 = _xx;
						nearest_y2 = _yy;
					}*/

				}
				
			}
		}
		
	}
	ds_list_destroy(list)

	}
	}
	}
	//Obj_grid Draw doesn't need
	//disX = nearest_x2
	//disY = nearest_y2
	
	Pathing(griding , need_inst , inst3 ,nearest_x,nearest_y)
//this.
	}
	ds_list_destroy(block_check)
	}
//Obj_grid Draw end
	checker = opener
	Finding(griding);
	}
}
Movement();
}