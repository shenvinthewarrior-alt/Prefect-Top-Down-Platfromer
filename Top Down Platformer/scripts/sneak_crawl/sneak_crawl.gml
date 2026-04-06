function sneak_crawl(cd,_x,_y,_iy2,n_i3){
if (_iy2 != noone && cd <= 1 &&
(
(point_in_rectangle(_x,_y,_iy2.bbox_left-64,_iy2.bbox_top,_iy2.bbox_left,_iy2.bbox_bottom))
|| (point_in_rectangle(_x,_y,_iy2.bbox_right,_iy2.bbox_top,_iy2.bbox_right+64,_iy2.bbox_bottom))
|| (point_in_rectangle(_x,_y,_iy2.bbox_left,_iy2.bbox_top-64,_iy2.bbox_right,_iy2.bbox_top))
|| (point_in_rectangle(_x,_y,_iy2.bbox_left,_iy2.bbox_bottom,_iy2.bbox_right,_iy2.bbox_bottom+64))
)
)
|| (n_i3 != noone && cd <= 1 &&
(
(point_in_rectangle(_x,_y,n_i3.bbox_left-64,n_i3.bbox_top,n_i3.bbox_left,n_i3.bbox_bottom))
|| (point_in_rectangle(_x,_y,n_i3.bbox_right,n_i3.bbox_top,n_i3.bbox_right+64,n_i3.bbox_bottom))
|| (point_in_rectangle(_x,_y,n_i3.bbox_left,n_i3.bbox_top-64,n_i3.bbox_right,n_i3.bbox_top))
|| (point_in_rectangle(_x,_y,n_i3.bbox_left,n_i3.bbox_bottom,n_i3.bbox_right,n_i3.bbox_bottom+64))
)
)
{
	return true
}
else
{
	return false
}

}

