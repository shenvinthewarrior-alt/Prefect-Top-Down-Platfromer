function Drin_Scr(){
{
	if (point_direction(x,y,attack_target.x,attack_target.y) > 337.5) ||
	(point_direction(x,y,attack_target.x,attack_target.y) < 22.5)
	{
		dirn = 0
	}
	else if (point_direction(x,y,attack_target.x,attack_target.y) > 22.5) &&
	(point_direction(x,y,attack_target.x,attack_target.y) < 67.5)
	{
		dirn = 45
	}
	else if (point_direction(x,y,attack_target.x,attack_target.y) > 67.5) &&
	(point_direction(x,y,attack_target.x,attack_target.y) < 112.5)
	{
		dirn = 90
	}
	else if (point_direction(x,y,attack_target.x,attack_target.y) > 112.5) &&
	(point_direction(x,y,attack_target.x,attack_target.y) < 157.5)
	{
		dirn = 135
	}
	else if (point_direction(x,y,attack_target.x,attack_target.y) > 157.5) &&
	(point_direction(x,y,attack_target.x,attack_target.y) < 202.5)
	{
		dirn = 180
	}
	else if (point_direction(x,y,attack_target.x,attack_target.y) > 202.5) &&
	(point_direction(x,y,attack_target.x,attack_target.y) < 247.5)
	{
		dirn = 225
	}
	else if (point_direction(x,y,attack_target.x,attack_target.y) > 247.5) &&
	(point_direction(x,y,attack_target.x,attack_target.y) < 292.5)
	{
		dirn = 270
	}
	else if (point_direction(x,y,attack_target.x,attack_target.y) > 292.5) &&
	(point_direction(x,y,attack_target.x,attack_target.y) < 337.5)
	{
		dirn = 315
	}
}
}