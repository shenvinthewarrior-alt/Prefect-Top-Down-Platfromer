if (object_index == Obj_block) || (object_index == Obj_block_pushable)
{
//Depth_sorting(false);
depth = -(       (bbox_top)+(bbox_bottom) + (position.z_height*(bbox_top/64)) + (position.z*image_yscale)     )

if (Obj_player.debug_test == true)
{
	if (position.z_height > 1000)
	{
	image_alpha = 0
	}
	else
	{
	image_alpha = 0.1
	}
}
else
{
	if (position.z_height > 1000) && (y == room_height)
	{
	image_alpha = 0//.1
	}
	else
	{
	image_alpha = 1
	}
}

if (Have_Ladder == true)
{
	instyyy = instance_create_depth(x,bbox_bottom,depth-1,Obj_ladder)
	if (Dir == 1 || Dir == 3)
	{
	instyyy.x = bbox_left +32 + LadderX
	instyyy.y = bbox_bottom
	}
	if (Dir == 2)
	{
	instyyy.x = bbox_right - 32
	instyyy.y = bbox_bottom - LadderX
	}
	
	instyyy.position.z = position.z
	instyyy.position.z_height = position.z_height
	instyyy.vis_yscale = image_yscale
	instyyy.LadderX = LadderX
	instyyy.Zheight = Zheight
	instyyy.Dir = Dir
	Have_Ladder = false
}

if (instyyy != noone)
{
	instyyy.moveX = moveX
	instyyy.moveY = moveY
	instyyy.moveZ = moveZ
}

}
else if (object_index == Obj_ladder)
{
	//depth = -bbox_bottom-1-(position.z*2);
	if (Dir != 1)
	{
	depth = -((bbox_bottom*100)+((position.z+max(position.z_height/63,32))*100))-1
	}
	else
	{
	depth = -((bbox_bottom*100)+((position.z+max(position.z_height/63,32))*100))-(144000/(bbox_bottom/64))-1
	}
}
else if (object_index == Obj_stair)
{
	depth = -((bbox_bottom*100)+((position.z+max(position.z_height/63,32))*100))
	/*
	if (image_index == 0) || (image_index == 2)
	{
	depth = -bbox_bottom+32-(position.z*2);
	}
	else if (image_index == 3)
	{
	depth = -bbox_bottom+64-(position.z*2);
	}
	else
	{
	depth = -bbox_bottom-(position.z*2);
	}*/
}
/*
var coll = instance_place(x+moveX,y+moveY,Obj_player)
if (coll)
{
	coll.x += moveX
	coll.y += moveY
}