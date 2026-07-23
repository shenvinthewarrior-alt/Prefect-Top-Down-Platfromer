function collision_check_zaxis_1(_xto, _yto, _rad, _targets, _get_obj=false) {
    
    /// Create a temporary list to store detected collision instances.
    var _list = ds_list_create();
    /// Check for collision at the given (x, y) coordinates with specified targets.
    if (collision_circle_list(_xto, _yto, _rad, _targets,1,1, _list, 0)) {

        /// Loop through all detected collisions.
        for (var _i = 0; _i < ds_list_size(_list); _i++) {
            var _collide = _list[| _i];
            
            /// Ignore collision with self.
            if (_collide.id == id) {
                continue;
            }
            
            /// Check if the collided instance has position data (uses Position system).
            if (_collide != noone && variable_instance_exists(_collide, "position")) {
                var _pos2 = _collide.position;

                /// Define the feet and head z positions for current object.
                var _zfeet = position.z //+ position.z_step;
                var _zhead = position.z_top(_pos2);
				/*if (_zhead <= _pos2.z && _pos2.z - _zhead < self.position.z_speed)
				{
					self.position.z_speed = _pos2.z - _zhead
				}*/
                /// If the player's feet are below the platform's top, 
				/// and the head is above the platform's base, it is a valid landing zone.
				
				var cx = clamp(_xto,_collide.bbox_left,_collide.bbox_right);
				var cy = clamp(_yto,_collide.bbox_top,_collide.bbox_bottom); 
				var czing = clamp(_zfeet,_pos2.z,_pos2.z+_pos2.z_height);
				
				var tz = clamp(position.z+(position.z_height/2),position.z,position.z+position.z_height);
				
				var cz = czing
				if (cz > 0){cz = -czing}
				else{cz = czing}
				
				var dis = point_distance(_xto,_yto-_zfeet,cx,cy-cz)
				if (dis < _rad) && (!collision_line(_xto,_yto-tz,cx,cy-czing,Obj_block,false,true))
				
                //if (_zfeet-_rad2 < _pos2.z && _zfeet+_rad2 > _pos2.z)
				{
                    /// Also check that the platform is higher than our current ground by at least z_step.
                    //if (position.z_ground - position.z_step < _pos2.z_top(self) ) {
                        ds_list_destroy(_list);
                        if (_get_obj) {
                            return _collide;
                        }
                        return true;
                    //}
                }
            }
        }
    }

    /// Destroy list to avoid memory leaks.
    ds_list_destroy(_list);

    /// If an object was requested, return noone if none found; otherwise return false.
    if (_get_obj) {
        return noone;
    }
    return false;
}

