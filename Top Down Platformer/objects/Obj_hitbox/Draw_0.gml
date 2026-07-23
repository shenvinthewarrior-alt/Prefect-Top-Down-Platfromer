draw_sprite(sprite_index,image_index,x,y-(position.z+position.z_height))
draw_set_alpha(0.1)
draw_sprite(sprite_index,image_index,x,y-position.z)
draw_set_alpha(1)