function Collision(b ,LT ,LD ,RT ,RD ,TR ,TL ,DR ,DL , _x ,_y)
{
var pre_z = position.z_ground
if (actual_jump == 3){pre_z = position.z}else{pre_z = position.z_ground}

////     Collision_note here     ////
		
if (b.position.z+b.position.z_height <= pre_z+jump_dis 
&& (b.position.z+b.position.z_height <= max(0,pre_z-jump_dis)+jump_dis || Obj_player.position.z_ground <= position.z_ground)
&& (b.position.z+b.position.z_height > position.z || /*c*/ Obj_player.position.z_ground <= pre_z
) )
&& (
Corner(_x ,_y ,b ,LT ,LD ,RT ,RD ,TR ,TL ,DR ,DL)
)
{
	return true;
}
else
{
	return false
}
		
}