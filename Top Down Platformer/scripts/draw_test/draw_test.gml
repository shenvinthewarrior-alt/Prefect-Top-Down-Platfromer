function draw_test(_show=false){
	var yy = y;
	/// shadow
	if(_show){
		draw_set_alpha(0.5);
		var pos = get_midpoint();
		/// if swimming - shadow gets really deep
		var yto = position.z_ground >= 0 ? pos[1]-position.z_ground : pos[1]+16;
		draw_circle_color(pos[0],yto,8,c_black,c_black,0);
	}
	draw_set_alpha(1);
	y -= position.z;
	/// draw player at Z position
	draw_self();
	y = yy;
}