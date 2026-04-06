function Depth_sorting(entity){

if (entity == true)
{
var _list = ds_list_create();
var coll = noone;
//var coll1 = noone;
var depthering = 0;
var depthering1 = position.z_ground;
var _num = collision_rectangle_list(bbox_left-12 -(motion.x*max_spd), bbox_top-(motion.y*max_spd), bbox_right+12 -(motion.x*max_spd), bbox_bottom-(motion.y*max_spd), Obj_block, false, true, _list, false);
if (_num > 0)
{
    for (var i = 0; i < _num; ++i)
    {
		var main_coll = _list[| i];
		if (main_coll.position.z+main_coll.position.z_height == position.z_ground)
		{
			coll = main_coll
		}
		/*if (main_coll.position.z+main_coll.position.z_height >= position.z_ground)
		{
			coll1 = main_coll
		}*/
    }
}
ds_list_destroy(_list);

if (coll != noone)
{
	depthering = coll.sprite_height
	depthering1 = coll.depther//-63
}

var coll2 = noone
var nearest_dist2 = 99999999999
var depthering2 = position.z_ground;
var listing2 = ds_list_create()
var coll_count2 = collision_rectangle_list(bbox_left-12,bbox_top-(jump_dis+position.z_height),bbox_right+12,bbox_top,Obj_block,false,true,listing2,false)
if (coll_count2 > 0)
{
	for (var i = 0; i < coll_count2; ++i) {
		var main_coll = listing2[| i];
		if (main_coll.position.z+main_coll.position.z_height > position.z_ground) && (main_coll.depth < nearest_dist2) //&& (coll1 == noone)
		{
			nearest_dist2 = main_coll.depth
			coll2 = main_coll
		}
	}
}

ds_list_destroy(listing2)

if (coll2 != noone) && (coll == noone)
{
	depthering2 = coll2.depther//-63
}

depth = -(  bbox_bottom+depthering1+depthering2 +depthering )//10

}













else


{
	var _list = ds_list_create();
	var coll = noone;
	var nearest_dist2 = 99999999999
	var _num = collision_rectangle_list(bbox_left-1, bbox_top-(160+position.z_height), bbox_right+1, bbox_top, Obj_block, false, true, _list, false);
	if (_num > 0)
	{
	    for (var i = 0; i < _num; ++i)
	    {
			var main_coll = _list[| i];
			coll = main_coll
			if (main_coll.depther > depther)
			{
				depther = main_coll.depther+(-((main_coll.position.z*2)-1))+(position.z_height-32)
				//depther = main_coll.depther+position.z_height
				//(((main_coll.depther/*+position.z_height*/) /32)*room_height)
				depth_buffed = 2
			}
			else if (depth_buffed != 2)
			{
			/*if (main_coll.position.z_height > position.z_height) && 
			{*/
				depther = (((/*main_coll.*/position.z+main_coll.position.z_height-32) /32)*room_height)
				depth_buffed = 1
			//}
			}
	    }
	}
	ds_list_destroy(_list);

	if (coll == noone)
	{
		depther = (((position.z+position.z_height-32) /32)*room_height)
		depth_buffed = 0;
	}

	depth = -(  bbox_bottom+depther)//10
}

}