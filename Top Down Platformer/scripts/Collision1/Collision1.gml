function Collision1(b ,LT ,LD ,RT ,RD ,TR ,TL ,DR ,DL , _x ,_y)
{
var pre_z = Obj_enemy.position.z_ground
if (Obj_enemy.actual_jump == 3){pre_z = Obj_enemy.position.z}else{pre_z = Obj_enemy.position.z_ground}

////     Collision_note here     ////
		
if (b.position.z+b.position.z_height <= pre_z+Obj_enemy.jump_dis 
&& (b.position.z+b.position.z_height <= max(0,pre_z-Obj_enemy.jump_dis)+Obj_enemy.jump_dis || Obj_player.position.z_ground <= Obj_enemy.position.z_ground)
&& (b.position.z+b.position.z_height > Obj_enemy.position.z || /*c*/ Obj_player.position.z_ground <= pre_z
) )
&& (
Corner1(_x ,_y ,b ,LT ,LD ,RT ,RD ,TR ,TL ,DR ,DL)
)
{
	return true;
}
else
{
	return false
}
		
}