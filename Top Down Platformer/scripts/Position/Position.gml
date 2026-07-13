function Position(_height=32, _z=0) constructor {
    
    self.z = _z;
    self.z_speed = 0;
    self.z_gravity = 0.5;
    self.z_ground = 0;
    self.z_height = _height;
    self.z_step = 4;
    self.floor_obj = noone;
    self.z_minimum = -_height;
    self.parent = other;
	self.platform_motion = new Vector2();

    var _cx = (other.bbox_left + other.bbox_right) * 0.5;
    var _cy = (other.bbox_top + other.bbox_bottom) * 0.5;
    self.corners = [
        point_direction(_cx, _cy, other.bbox_right, other.bbox_top),
        point_direction(_cx, _cy, other.bbox_left, other.bbox_top),
        point_direction(_cx, _cy, other.bbox_left, other.bbox_bottom),
        point_direction(_cx, _cy, other.bbox_right, other.bbox_bottom)
    ];

	self.shape = "rectangular";
	
    z_top = function(src) {
        return self.z + self.z_height;
    };
	
    static on_ground = function() {
        return abs(self.z - self.z_ground) < self.z_step;
    };
	
    static get_floor_vector = function() {
        var _floor_vec = [0, 0, 0];
        if (self.floor_obj >= 0 && instance_exists(self.floor_obj)) {
            var _floor_pos = self.floor_obj.position;
            if (abs(self.z - _floor_pos.z_top(self)) <= self.z_step) {
                _floor_vec = [self.floor_obj.moveX, self.floor_obj.moveY, self.floor_obj.moveZ];
            }
        }
        return _floor_vec;
    };

    static collision_direction = function(_angle) {
        if (self.shape == "circle") return _angle;
        if (_angle < self.corners[0]) return 0;
        if (_angle < self.corners[1]) return 90;
        if (_angle < self.corners[2]) return 180;
        if (_angle < self.corners[3]) return 270;
        return 0;
    };

    static reset_z_ground = function() {
        self.z_ground = self.z_minimum;
        self.floor_obj = noone;
    };

    static update = function(wall_parent) {
        //--- Z-axis movement ---
        self.z += self.z_speed;
        if (self.z > self.z_ground) {
            self.z_speed -= self.z_gravity;
        } else {
            self.z = max(self.z, self.z_ground);
			var _floor_spd = self.get_floor_vector();
			
			if (_floor_spd[2] >= 1)
			{
				self.z_speed = 0;
			}
            else
			{
				self.z_speed = max(self.z_speed, _floor_spd[2]);
			}
        }
		
        //--- Ground/platform detection ---
        with (other) {
            var _list = ds_list_create();
            other.reset_z_ground();

            if (instance_place_list(x, y, wall_parent, _list, 0)) {
                for (var _i = 0; _i < ds_list_size(_list); _i++) {
                    var _collide = _list[| _i];
                    if (_collide.id == id) continue;

                    if (_collide != noone && variable_instance_exists(_collide, "position")) {
                        var _pos2 = _collide.position;
                        if (other.z + other.z_step+_collide.platformSpeed > _pos2.z_top(other)) {
                            other.z_ground = max(other.z_ground, _pos2.z_top(other)+_collide.moveZ);
                            other.floor_obj = _collide;
                        }
                    }
                }
            }
            ds_list_destroy(_list);
        }

        //--- Platform motion transfer ---
        var _platform_speed = self.get_floor_vector();
		other.x += _platform_speed[0];
        other.y += _platform_speed[1];
		other.position.z += _platform_speed[2];
    };
}


