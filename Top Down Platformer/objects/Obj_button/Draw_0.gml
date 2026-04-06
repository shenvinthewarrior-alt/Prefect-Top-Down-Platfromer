var yy = y;
draw_set_alpha(1);
y -= position.z;
draw_sprite_ext(Spr_button,image_index,x,bbox_bottom-24,image_xscale,image_yscale,0,c_white,1)
//draw_sprite_ext(Spr_skin_2,image_index,x,bbox_bottom,image_xscale,(Zheight_cal/32)-1,0,c_white,1)
y = yy

draw_text(x,bbox_bottom,active)