function get_midpoint(){
	var xmid = (bbox_left + bbox_right) * 0.5;
	var ymid = (bbox_top + bbox_bottom) * 0.5;
	return [xmid, ymid];
}