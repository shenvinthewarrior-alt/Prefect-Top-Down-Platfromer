function object_get_center(_obj){
	var _center = new Vector2(
		(_obj.bbox_left + _obj.bbox_right) * 0.5,
		(_obj.bbox_top + _obj.bbox_bottom) * 0.5
	);
	return _center;
}