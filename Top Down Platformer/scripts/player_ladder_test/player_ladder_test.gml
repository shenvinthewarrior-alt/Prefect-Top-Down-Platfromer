function player_ladder_test(_move_vec){
	/// check if player is moving up/down only
	
	var _check_ladder = collision_check_zaxis(bbox_left, bbox_top- max_spd, bbox_right, bbox_bottom, Obj_ladder, true);
	var _check_ladder1 = collision_check_zaxis(bbox_left, bbox_top, bbox_right+max_spd, bbox_bottom, Obj_ladder, true);
	var _check_ladder2 = collision_check_zaxis(bbox_left, bbox_top, bbox_right, bbox_bottom+max_spd, Obj_ladder, true);
	var _check_ladder3 = collision_check_zaxis(bbox_left-max_spd, bbox_top, bbox_right, bbox_bottom, Obj_ladder, true);
	
	if (_check_ladder) && (_check_ladder.Dir == 3)
	{
	
	if(abs(_move_vec.x) <= 0.2 && _move_vec.y != 0){
		/// check for collision with ladder 6 pixels up or down
		/// if ladder exists, check to see if we are trying to climb it
		if(_check_ladder >= 0 && instance_exists(_check_ladder)){
			var _center = object_get_center(_check_ladder);
			if(sign(_center.y - y) == sign(_move_vec.y)){
				/// set ladder object and change the state
				ladder_object = _check_ladder;
				state = player_state_climb;
			}
		}
	}
	
	}
	
	if (_check_ladder2) && (_check_ladder2.Dir == 1)
	{
	
	if(abs(_move_vec.x) <= 0.2 && _move_vec.y != 0){
		/// check for collision with ladder 6 pixels up or down
		/// if ladder exists, check to see if we are trying to climb it
		if(_check_ladder2 >= 0 && instance_exists(_check_ladder2)){
			var _center = object_get_center(_check_ladder2);
			if(sign(_center.y - y) == sign(_move_vec.y)){
				/// set ladder object and change the state
				ladder_object = _check_ladder2;
				state = player_state_climb;
			}
		}
	}
	
	}
	
	if (_check_ladder1) && (_check_ladder1.Dir == 2)
	{
	
	if(abs(_move_vec.y) <= 0.2 && _move_vec.x != 0){
		/// check for collision with ladder 6 pixels up or down
		/// if ladder exists, check to see if we are trying to climb it
		if(_check_ladder1 >= 0 && instance_exists(_check_ladder1)){
			var _center = object_get_center(_check_ladder1);
			if(sign(_center.x - x) == sign(_move_vec.x)){
				/// set ladder object and change the state
				ladder_object = _check_ladder1;
				state = player_state_climb;
			}
		}
	}
	
	}
	
	if (_check_ladder3) && (_check_ladder3.Dir == 0)
	{
	
	if(abs(_move_vec.y) <= 0.2 && _move_vec.x != 0){
		/// check for collision with ladder 6 pixels up or down
		/// if ladder exists, check to see if we are trying to climb it
		if(_check_ladder3 >= 0 && instance_exists(_check_ladder3)){
			var _center = object_get_center(_check_ladder3);
			if(sign(_center.x - x) == sign(_move_vec.x)){
				/// set ladder object and change the state
				ladder_object = _check_ladder3;
				state = player_state_climb;
			}
		}
	}
	
	}
}