//Draw
//draw_self()
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,0,c_white,0.3)
var yy = y;
draw_set_alpha(1);
y -= position.z;
/// draw player at Z position

/*draw_sprite_ext(Spr_skin_1,image_index,x,bbox_bottom-(64-32),image_xscale,image_yscale,0,c_lime,1)
draw_sprite_ext(Spr_skin_2,image_index,x,bbox_bottom,image_xscale,(64/32)-1,0,c_lime,1)*/
//64

//draw_sprite_ext(Spri_test_1,image_index,x,bbox_bottom,image_xscale,1/*-1*/,0,c_white,1)
//draw_sprite_ext(Sprite16,image_index,x,bbox_bottom-104,image_xscale,image_yscale,0,c_white,1)
//draw_rectangle(bbox_left+lengthdir_x(max_spd,anim_dir), bbox_top+lengthdir_y(max_spd,anim_dir), bbox_right+lengthdir_x(max_spd,anim_dir), bbox_bottom +lengthdir_y(max_spd,anim_dir),true)
draw_sprite_ext(sprite_moving,image_moving,x,bbox_bottom,image_xscale,1/*-1*/,0,c_white,1)
//0.575
y = yy;

draw_text(x,bbox_bottom,localFrame)

/*
var coll2 = noone
var listing2 = ds_list_create()
var coll_count2 = collision_rectangle_list(bbox_left,bbox_top,bbox_right,bbox_bottom,Obj_block,false,true,listing2,false)
if (coll_count2 > 0)
{
	for (var i = 0; i < coll_count2; ++i) {
		var main_coll = listing2[| i];
		//var dist = point_distance(x,y,x,main_coll.y)
		if (main_coll.position.z+main_coll.position.z_height >= position.z_ground) 
		{
			coll2 = main_coll
		}
	}
}

ds_list_destroy(listing2)

if (coll2 != noone)
{
	draw_rectangle(coll2.bbox_left,coll2.bbox_top,coll2.bbox_right,coll2.bbox_bottom,true)
}