function zaxis_collision_handler(_wall_parent) {
    
    /// @var {Instance|Noone} _stuck
    /// Check for collision with a platform directly beneath or intersecting this instance.
    var _stuck = collision_check_zaxis(bbox_left, bbox_top, bbox_right, bbox_bottom, _wall_parent, true);
	

    /// If a valid collision object is found...
    if (_stuck != noone && instance_exists(_stuck)) {

        /// Cancel upward motion if currently moving up.
        if (position.z_speed > 0) {
            position.z_speed = 0;
        }

        /// If the player is on or below the ground level, try to resolve the collision.
        if (position.z < position.z_ground) {

            /// Find center of the colliding object.
            var _cx = (_stuck.bbox_left + _stuck.bbox_right) * 0.5;
            var _cy = (_stuck.bbox_top + _stuck.bbox_bottom) * 0.5;

            /// Get angle from platform center to player.
            var _dsin = point_direction(_cx, _cy, x, y);

            /// Determine push-out direction based on platform's shape and direction.
            var _ds = _stuck.position.collision_direction(_dsin);
            var _dx = lengthdir_x(10, _ds);
            var _dy = lengthdir_y(10, _ds);

            /// Attempt to push the object out, up to 4 times.
            var _try_count = 4;
            while (collision_check_zaxis(bbox_left, bbox_top, bbox_right, bbox_bottom, _wall_parent, true) != noone) {
                x += _dx;
                y += _dy;

                /// If attempts are exhausted, stop trying.
                if (_try_count-- <= 0) {
                    break;
                }
            }
        }
    }
}


