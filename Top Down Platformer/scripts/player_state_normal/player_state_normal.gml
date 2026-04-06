function player_state_normal(){
	if (object_index != Obj_enemy)
	{
		player_function()
	}
	else
	{
		enemy_function()
	}
}