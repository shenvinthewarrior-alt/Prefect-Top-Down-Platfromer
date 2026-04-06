depth = -y-(position.z*2);
var coll = collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,Obj_block,false,true)
if (coll && coll.available_choice == available_choice)
{
	position.z = coll.position.z+coll.position.z_height
}

if instance_place(x,y,Obj_player) && (Obj_player.position.z >= position.z && Obj_player.position.z <= position.z+4)
{
	active = 1;
}
else
{
	active = 0;
}

image_index = active