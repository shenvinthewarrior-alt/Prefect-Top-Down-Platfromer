function Jump_over1(AL,AR,AT,AD,_zL,_zR,_zT,_zD,b,_z,_x,_y,AL3,AR3,AT3,AD3,AL4,AR4,AT4,AD4,cdL,cdR,cdT,cdD){
if 
(
	(AL != noone && ((_zL >= AL.position.z+AL.position.z_height
	&& (cdL <= 1 || (AL3 == noone || (AL3.position.z > b.position.z+b.position.z_height)))
	&& (AL.position.z+AL.position.z_height >= b.position.z+b.position.z_height - Obj_enemy.jump_dis)
	&& ((Obj_enemy.position.z > AL.position.z+AL.position.z_height-32 && Obj_enemy.position.z >= 32)
	|| (Obj_enemy.position.z >= AL.position.z+AL.position.z_height-32 && Obj_enemy.position.z < 32))
	)
	||(_z >= AL.position.z+AL.position.z_height && //_z <= position.z_ground+jump_dis &&
	point_in_rectangle(_x,_y,AL.bbox_left-64,AL.bbox_top-32,AL.bbox_left-16,AL.bbox_bottom+32)
	&& (Obj_enemy.position.z < AL.position.z+AL.position.z_height-32
	|| AL4 != noone && AR != noone && Obj_enemy.position.z_ground >= AL4.position.z)
	&& ((AR3 == noone && AL.position.z+AL.position.z_height < b.position.z) || (AR3 != noone && AL.position.z+AL.position.z_height > AR3.position.z))
	&& (AL3 != noone && AL3.position.z+AL3.position.z > b.position.z-64 && AL3.position.z+AL3.position.z < b.position.z)
	))
	)
||
	(AR != noone && ((_zR >= AR.position.z+AR.position.z_height
	&& (cdR <= 1 || (AR3 == noone || (AR3.position.z > b.position.z+b.position.z_height)))
	&& (AR.position.z+AR.position.z_height >= b.position.z+b.position.z_height - Obj_enemy.jump_dis)
	&& ((Obj_enemy.position.z > AR.position.z+AR.position.z_height-32 && Obj_enemy.position.z >= 32)
	|| (Obj_enemy.position.z >= AR.position.z+AR.position.z_height-32 && Obj_enemy.position.z < 32))
	)
	||(_z >= AR.position.z+AR.position.z_height && //_z <= position.z_ground+jump_dis &&
	point_in_rectangle(_x,_y,AR.bbox_right+16,AR.bbox_top-32,AR.bbox_right+64,AR.bbox_bottom-32)
	&& (Obj_enemy.position.z < AR.position.z+AR.position.z_height-32
	|| AR4 != noone && AL != noone && Obj_enemy.position.z >= AR4.position.z)
	&& ((AL3 == noone && AR.position.z+AR.position.z_height < b.position.z) || (AL3 != noone && AR.position.z+AR.position.z_height > AL3.position.z))
	&& (AR3 != noone && AR3.position.z+AR3.position.z > b.position.z-64 && AR3.position.z+AR3.position.z < b.position.z)
	))
	)
||
	(AT != noone && ((_zT >= AT.position.z+AT.position.z_height
	&& (cdT <= 1 || (AT3 == noone || (AT3.position.z > b.position.z+b.position.z_height)))
	&& (AT.position.z+AT.position.z_height >= b.position.z+b.position.z_height - Obj_enemy.jump_dis)
	&& ((Obj_enemy.position.z > AT.position.z+AT.position.z_height-32 && Obj_enemy.position.z >= 32)
	|| (Obj_enemy.position.z >= AT.position.z+AT.position.z_height-32 && Obj_enemy.position.z < 32))
	)
	||(_z >= AT.position.z+AT.position.z_height && //_z <= position.z_ground+jump_dis &&
	point_in_rectangle(_x,_y,AT.bbox_left-32,AT.bbox_bottom+16,AT.bbox_right-32,AT.bbox_bottom+64)
	&& (Obj_enemy.position.z < AT.position.z+AT.position.z_height-32
	|| AT4 != noone && AD != noone && Obj_enemy.position.z >= AT4.position.z)
	&& ((AD3 == noone && AT.position.z+AT.position.z_height < b.position.z) || (AD3 != noone && AT.position.z+AT.position.z_height > AD3.position.z))
	&& (AD3 != noone && AD3.position.z+AD3.position.z > b.position.z-64 && AD3.position.z+AD3.position.z < b.position.z)
	))
	)
||
	(AD != noone && ((_zD >= AD.position.z+AD.position.z_height
	&& (cdD <= 1 || (AD3 == noone || (AD3.position.z > b.position.z+b.position.z_height)))
	&& (AD.position.z+AD.position.z_height >= b.position.z+b.position.z_height - Obj_enemy.jump_dis)
	&& ((Obj_enemy.position.z > AD.position.z+AD.position.z_height-32 && Obj_enemy.position.z >= 32)
	|| (Obj_enemy.position.z >= AD.position.z+AD.position.z_height-32 && Obj_enemy.position.z < 32))
	)
	||(_z >= AD.position.z+AD.position.z_height && //_z <= position.z_ground+jump_dis &&
	point_in_rectangle(_x,_y,AD.bbox_left-32,AD.bbox_top-64,AD.bbox_right-32,AD.bbox_top-16)
	&& (Obj_enemy.position.z < AD.position.z+AD.position.z_height-32
	|| AD4 != noone && AT != noone && Obj_enemy.position.z >= AD4.position.z)
	&& ((AT3 == noone && AD.position.z+AD.position.z_height < b.position.z) || (AT3 != noone && AD.position.z+AD.position.z_height > AT3.position.z))
	&& (AT3 != noone && AT3.position.z+AT3.position.z > b.position.z-64 && AT3.position.z+AT3.position.z < b.position.z)
	
	))
	)
)
{
	return true
}
else
{
	return false
}

}
