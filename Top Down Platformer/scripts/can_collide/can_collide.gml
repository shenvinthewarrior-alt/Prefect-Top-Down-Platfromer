function can_collide(them = Obj_player, _obj = id){
	with(them){
		if(_obj != noone && variable_instance_exists(_obj, "position")){
			var _pos2 = _obj.position;
			/// if self is above the top of the other object, z_ground will now be at that height
			var _zfeet = position.z + position.z_step;
			var _zhead = position.z_top(them);
			
			/// check if connecting with block
			if(_zfeet < _pos2.z_top(position) && _zhead >= _pos2.z && position.z_ground < (_pos2.z_top(position)-1)){
				/// also, going to fall into this!
				if(position.z_ground - position.z_step < _pos2.z_top(position)){
					return true;
				}
			} 
		}
		return false;
	}
}