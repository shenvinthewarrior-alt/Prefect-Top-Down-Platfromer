function push_object(_block = Obj_block,_player = Obj_player){

	//var _block = Obj_block;
	var _widthPlayerCollision = (sprite_width/1.75);//sprite_width * 0.21;
	var _widthWallCollision = (sprite_width/1.75);//sprite_width * 0.21;
	var _target = -1;
	var _dot = 0;
	push.x = 0;
	push.y = 0;
	var _xc = (bbox_left + bbox_right) * 0.5;
	var _yc = (bbox_top + bbox_bottom) * 0.5;
	var _pushedByObject = 0;


	for(var i = 0; i < array_length(push_directions); i++){
		var _px = _xc //+ push_directions[i].x;
		var _py = _yc //+ push_directions[i].y;
		//collision_rectangle(_px-_widthPlayerCollision,_py-_widthPlayerCollision,_px+_widthPlayerCollision,_py+_widthPlayerCollision,_player,1,1 )
		//collision_rectangle(_px-_widthWallCollision,_py-_widthWallCollision,_px+_widthWallCollision,_py+_widthWallCollision,_block,1,1 )
		xx = _px;
		yy = _py;
		length = _widthWallCollision;
		var _detect = collision_rectangle(_px-_widthPlayerCollision,_py-_widthPlayerCollision,_px+_widthPlayerCollision,_py+_widthPlayerCollision,_player,1,1 )//collision_circle(_px, _py, _widthPlayerCollision, _player, 1, 1);
		var _detect2 = collision_rectangle(_px-_widthWallCollision,_py-_widthWallCollision,_px+_widthWallCollision,_py+_widthWallCollision,_block,1,1 )//collision_circle(_px, _py, _widthWallCollision, _block, 1, 1);
		var _collisionObj = instance_exists(_detect) ? _detect : _detect2;
		var _canCollide = false;
		
		/// pushed by player object
		if(instance_exists(_detect)){
			_dot = dot_product(_detect.motion.x, _detect.motion.y, -push_directions[i].x, -push_directions[i].y);
			_canCollide = can_collide();
		}
		/// pushed by other object
		else if(instance_exists(_detect2)){
			var _dir = point_direction(_detect2.x, _detect2.y, x, y);
			var _dx = lengthdir_x(1, _dir);
			var _dy = lengthdir_y(1, _dir);
			_canCollide = can_collide(id, _detect2);
			_pushedByObject = 1;
			_dot = 1;
		}
	
		if(instance_exists(_collisionObj) && _dot > 0.1 && _canCollide){
			push.x -= push_directions[i].x;
			push.y -= push_directions[i].y;
			break;
		}
	}

	if(push.length() > 0){
		
		var _acc = _pushedByObject ? push_wall_accelerate : push_acceleration;
		
		push.set_length(_acc * _dot);
		
		motion.x += push.x;
		motion.y += push.y;
	} else {
		motion.x = lerp(motion.x, 0, push_friction);	
		motion.y = lerp(motion.y, 0, push_friction);	
	}
	
	if(motion.length() > 0){
		
		if(motion.length() > push_max_speed){
			motion.set_length(push_max_speed);	
		}
		
		
		if(collision_check_zaxis(x + motion.x, y, _block)){
			motion.x = 0;
		}
		if(collision_check_zaxis(x, y + motion.y, _block)){
			motion.y = 0;
		}
		
		/*var check = collision_rectangle(bbox_right-1,bbox_top,bbox_right,bbox_bottom,Obj_stair,1,1)
		var check1 = collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_top+1,Obj_stair,1,1)
		var check2 = collision_rectangle(bbox_left,bbox_top,bbox_left+1,bbox_bottom,Obj_stair,1,1)
		var check3 = collision_rectangle(bbox_left,bbox_bottom-1,bbox_right,bbox_bottom,Obj_stair,1,1)
		if(check && check.image_index == 0 && check.position.z_height2 >= position.z_ground && check.position.z_height <= position.z_ground){
			motion.x -= 1
		}
		if(check1 && check1.image_index == 1 && check1.position.z_height2 >= position.z_ground && check1.position.z_height <= position.z_ground){
			motion.y += 1
		}
		if(check2 && check2.image_index == 2 && check2.position.z_height2 >= position.z_ground && check2.position.z_height <= position.z_ground){
			motion.x += 1
		}
		if(check3 && check3.image_index == 3 && check3.position.z_height2 >= position.z_ground && check3.position.z_height <= position.z_ground){
			motion.y -= 1
		}*/
		
		x += motion.x*push_max_speed
		y += motion.y*push_max_speed
		//moveX = motion.x;
		//moveY = motion.y;
	}
}