//draw_self()
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,0,c_white,0.3)
var yy = y;
draw_set_alpha(1);
y -= position.z;

//draw_sprite_ext(Spr_skin_1,image_index,x,bbox_bottom-(64-32),image_xscale,image_yscale,0,c_maroon,1)
//draw_sprite_ext(Spr_skin_2,image_index,x,bbox_bottom,image_xscale,(64/32)-1,0,c_maroon,1)
draw_sprite_ext(sprite_moving,image_moving,x,y,1,1/*-1*/,0,c_white,1)
y = yy;
//draw_text(x,bbox_bottom,jump_count)
//////
if (Obj_player.debug_test = true)
{
draw_path(path,x,y,false)

draw_circle_color(target_x,target_y,5,c_green,c_green,false)
draw_circle_color(xxxxx,yyyyy,5,c_lime,c_lime,true)
draw_line_color(x,y,x+lengthdir_x(dist_,dir_),y+lengthdir_y(dist_,dir_),c_aqua,c_aqua)
//draw_text(x,bbox_bottom+32,attack_stage)
//draw_rectangle(x,y-32,x-256,y+32,true)
//draw_text(x,y,Obj_player.position.z-position.z)

}

if (checked != noone)
{
	draw_rectangle(checked.bbox_left,checked.bbox_top,checked.bbox_right,checked.bbox_bottom,true)
}