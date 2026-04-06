function Finding( g ){

if (mp_grid_path(g, path, x, y, target_x, target_y, true) && (voidAllow == 0)) 
{
path_start(path, 0, path_action_stop, false);
path_end();

var xx = path_get_point_x(path,1)
var yy = path_get_point_y(path,1)

if (x < xx-1) && (y <= yy+1 && y >= yy-1)
{
	dir = 0;
}
else if (x > xx+1) && (y <= yy+1 && y >= yy-1) 
{
	dir = 180;
}
else if (x <= xx+1 && x >= xx-1) && (y < yy-1) 
{
	dir = 270;
}
else if (x <= xx+1 && x >= xx-1) && (y > yy+1) 
{
	dir = 90;
}	
else if (x < xx-1) && (y < yy-1) 
{
	dir = 315;
}
else if (x > xx+1) && (y < yy-1) 
{
	dir = 225;
}
else if (x < xx-1) && (y > yy+1) 
{
	dir = 45;
}
else if (x > xx+1) && (y > yy+1) 
{
	dir = 135;
}
else 
{
	dir = -1;
}

switch (dir)
	{
	case -1:
		xspd = 0;
		yspd = 0;
		if (snapping != 2)
		{
			snapping = 2;
			//y = round(y/2)*2;
			//x = round(x/2)*2;
		}
	break;

	case 0:
		xspd = 1;
		yspd = 0;
		if (snapping != 1)
		{
			snapping = 1;
			y = round(y/2)*2;
		}
	break;

	case 90:
		xspd = 0;
		yspd = -1;
		if (snapping != 1)
		{
			snapping = 1;
			x = round(x/2)*2;
		}
	break;

	case 180:
		xspd = -1;
		yspd = 0;
		if (snapping != 1)
		{
			snapping = 1;
			y = round(y/2)*2;
		}
	break;

	case 270:
		xspd = 0;
		yspd = 1;
		if (snapping != 1)
		{
			snapping = 1;
			x = round(x/2)*2;
		}
	break;

	case 45:
		xspd = 1;
		yspd = -1;
		snapping = 0;
	break;

	case 135:
		xspd = -1;
		yspd = -1;
		snapping = 0;
	break;

	case 225:
		xspd = -1;
		yspd = 1;
		snapping = 0;
	break;

	case 315:
		xspd = 1;
		yspd = 1;
		snapping = 0;
	break;
	}
}

}