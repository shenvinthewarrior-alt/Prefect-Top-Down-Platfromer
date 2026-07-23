//draw_self()
var yy = y;
draw_set_alpha(1);
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,0,c_white,0.3)
y -= position.z;
/// draw player at Z position

if (object_index == Obj_block) || (object_index == Obj_block_pushable) || (object_index == Obj_Door)
{
draw_sprite_ext(Spr_skin_1,image_index,x,bbox_bottom-(Zheight_cal-32),image_xscale,image_yscale,0,c_white,image_alpha)
draw_sprite_ext(Spr_skin_2,image_index,x,bbox_bottom,image_xscale,(Zheight_cal/32)-1,0,c_white,image_alpha)
draw_text(x,bbox_bottom,depth)


//draw_text(x,bbox_bottom+16,depth)
}
else if (object_index = Obj_stair)
{
if (Zheight_cal != 64)
{
draw_sprite_ext(Spr_Stair_skin2_1,image_index,x,bbox_top-(Zheight_cal-64),image_xscale,1,0,c_white,1)
draw_sprite_ext(Spr_Stair_skin_1,image_index,x,y-(Zheight_cal-64),image_xscale,image_yscale,0,c_white,1)
draw_sprite_ext(Spr_skin_2,image_index,x,bbox_bottom,image_xscale,(Zheight_cal/32)-2,0,c_white,1)
//draw_text(x,bbox_bottom+64,position.z_height)
//draw_text(x,bbox_bottom+96,position.z)
//draw_text(x,bbox_bottom+128,Zpos)
//draw_text(x,bbox_bottom+160,Zheight_cal)
}
else
{
draw_sprite_ext(Spr_Stair_skin2_1,image_index,x,bbox_top,image_xscale,1,0,c_white,1)
draw_sprite_ext(Spr_Stair_skin_1,image_index,x,y,image_xscale,image_yscale,0,c_white,1)
//draw_text(x,bbox_bottom+64,position.z_height)
//draw_text(x,bbox_bottom+96,position.z)
//draw_text(x,bbox_bottom+128,Zpos)
//draw_text(x,bbox_bottom+160,Zheight_cal)
}
}
else if (object_index = Obj_ladder)
{
if (Obj_player.debug_test == true)
{
draw_text(x,bbox_bottom+32,depth)
}
if (Dir != 1)
{

if (Dir == 2)
{
	draw_sprite_ext(sprite_index,Dir,x,y,image_xscale,(position.z_height/64),0,c_white,1)
	draw_sprite_ext(Spr_vis_ladder_1,image_index,x,bbox_bottom-position.z_height,-1,1,0,c_white,1)
	//draw_sprite_ext(sprite_index,Dir,x,y,image_xscale,(position.z_height/64)-0.5,0,c_white,1)
	//draw_sprite_ext(Spr_vis_ladder,image_index,x,bbox_bottom-position.z_height,1,1,0,c_white,1)
}
else if (Dir == 0)
{
	draw_sprite_ext(sprite_index,Dir,x,y,image_xscale,(position.z_height/64),0,c_white,1)
	draw_sprite_ext(Spr_vis_ladder_1,image_index,x,bbox_bottom-position.z_height,1,1,0,c_white,1)
}
else if (Dir == 3)
{
	draw_sprite_ext(sprite_index,Dir,x,y,image_xscale,(position.z_height/64),0,c_white,1)
}


}
else
{
draw_sprite_ext(sprite_index,3,x,y-(64*vis_yscale),image_xscale,(position.z_height/64),0,c_white,0.2)
}

}

y = yy;
