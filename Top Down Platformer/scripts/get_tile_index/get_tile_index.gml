function get_tile_index(_xto, _yto, _layer_name = "Floor"){
	var _lay_id = layer_get_id(_layer_name);
	var _map_id = layer_tilemap_get_id(_lay_id);
	return tilemap_get_at_pixel(_map_id, _xto, _yto);
}