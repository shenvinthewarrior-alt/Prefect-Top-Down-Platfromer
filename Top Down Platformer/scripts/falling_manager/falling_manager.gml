function falling_manager(){

		if(position.z >= 0){
			position.z_minimum = 0;
		}

	/// sort y position when above water
	if(position.z > -1){
		depth = -y-(position.z*2);
		position.z_gravity = 0.5;
	}
}