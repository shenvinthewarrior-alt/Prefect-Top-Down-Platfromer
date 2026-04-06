function setup_movable_wall(){
	/// set up push collisions
	var _size = sprite_width * 0.3;

	/// allow pushing in all directions (or just some of them if you want)
	push_directions = [
		new Vector2(-_size, 0),
		new Vector2(_size, 0),
		new Vector2(0, -_size),
		new Vector2(0, _size)
	];

	push = new Vector2();
	push_max_speed = 1;
	/// player to wall push acceleration
	push_acceleration = 0.1;
	/// wall to wall push acceleration
	push_wall_accelerate = 1;
	push_friction = 0.5;
	motion = new Vector2();
}