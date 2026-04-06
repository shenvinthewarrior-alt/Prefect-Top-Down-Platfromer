// Code I didn't use anymore.

function Mole_mode(_i,g,_x,_y,dis,ndis,dis2,ndis2,nx,ny,nx2 ,ny2){

if (_i != noone)
{
var pre_z11 = position.z_ground
if (actual_jump != 3) {pre_z11 = position.z} else {pre_z11 = position.z_ground}
			
if (_i.min_z < pre_z11 && _i.max_z >= pre_z11 && 0 <= pre_z11)
|| (_i.min_z <= pre_z11 && _i.max_z > pre_z11 && 0 > pre_z11)
{
	if (mp_grid_path(g, path, x, y, _x, _y, true) && (dis < ndis && dis != 0))
	{
		ndis = dis;
		nx = _x;
		ny = _y;
	}
	if (mp_grid_path(g, path, x, y, _x, _y, true) && (dis2 < ndis2))
	{
		ndis2 = dis2;
		nx = _x;
		ny = _y;
	}
}
}

}