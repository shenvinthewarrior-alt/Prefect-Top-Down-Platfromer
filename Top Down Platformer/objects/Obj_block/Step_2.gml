x += moveX;
y += moveY;
position.z += moveZ


if (active_style == 0)
{
	if (goingToStart) {
	
	if point_distance(x, y+position.z, startX, startY+startZ) <= currentSpeed
	{
		currentSpeed = point_distance(x, y+position.z, startX, startY+startZ)
	}
	
	if (x == startX) && (y == startY) && (position.z == startZ)
	{
	goingToStart = false;
	currentSpeed = 0;
	alarm[0] = waitTime;
	waitTime = Cooldown;
	}
	
	}
	// Check if it's at ending position
	else if (!goingToStart) {
		if point_distance(x, y+position.z, endX, endY+endZ) <= currentSpeed
		{
			currentSpeed = point_distance(x, y+position.z, endX, endY+endZ)
		}
	
		if (x == endX) && (y == endY) && (position.z == endZ)
		{
		goingToStart = true;
		currentSpeed = 0;
		alarm[0] = waitTime;
		waitTime = Cooldown;
		}
	}

}

else if (active_style == 1)
{
	if (activate == 1)
	{

	if (goingToStart) {
	
		if point_distance(x, y+position.z, startX, startY+startZ) <= currentSpeed
		{
			currentSpeed = point_distance(x, y+position.z, startX, startY+startZ)
		}
	
		if (x == startX) && (y == startY) && (position.z == startZ)
		{
		goingToStart = false;
		currentSpeed = 0;
		alarm[0] = waitTime;
		waitTime = Cooldown;
		}
	
	}
	// Check if it's at ending position
	else if (!goingToStart) {
		if point_distance(x, y+position.z, endX, endY+endZ) <= currentSpeed
		{
			currentSpeed = point_distance(x, y+position.z, endX, endY+endZ)
		}
	
		if (x == endX) && (y == endY) && (position.z == endZ)
		{
		goingToStart = true;
		currentSpeed = 0;
		alarm[0] = waitTime;
		waitTime = Cooldown;
		}
	}

	}

}

else if (active_style == 2)
{
	if (activate == 1)
	{

	if (goingToStart) {
	
		if point_distance(x, y+position.z, startX, startY+startZ) <= currentSpeed
		{
			currentSpeed = point_distance(x, y+position.z, startX, startY+startZ)
		}
	
		if (x == startX) && (y == startY) && (position.z == startZ)
		{
		goingToStart = false;
		currentSpeed = 0;
		alarm[0] = waitTime;
		waitTime = Cooldown;
		}
	
	}
	// Check if it's at ending position
	else if (!goingToStart) {
		if point_distance(x, y+position.z, endX, endY+endZ) <= currentSpeed
		{
			currentSpeed = point_distance(x, y+position.z, endX, endY+endZ)
		}
	
		if (x == endX) && (y == endY) && (position.z == endZ)
		{
		goingToStart = true;
		currentSpeed = 0;
		alarm[0] = waitTime;
		waitTime = Cooldown;
		}
	}

	}
	
}

else if (active_style == 3)
{
	if (activate == 1)
	{
	var offset_time = 0;
	if (Cooldown == 1)
	{
		offset_time = 1;
	}
		
	if (goingToStart) {
	
		if point_distance(x, y+position.z, startX, startY+startZ) <= currentSpeed
		{
			currentSpeed = point_distance(x, y+position.z, startX, startY+startZ)
		}
	
		if (x == startX) && (y == startY) && (position.z == startZ)
		{
		currentSpeed = 0;
		alarm[0] = waitTime+offset_time;
		waitTime = Cooldown;
		}
	
	}
	// Check if it's at ending position
	else if (!goingToStart) {
		if point_distance(x, y+position.z, endX, endY+endZ) <= currentSpeed
		{
			currentSpeed = point_distance(x, y+position.z, endX, endY+endZ)
		}
	
		if (x == endX) && (y == endY) && (position.z == endZ)
		{
		currentSpeed = 0;
		alarm[0] = waitTime+offset_time;
		waitTime = Cooldown;
		}
	}

	}
	
}

else if (active_style == 4)
{
	if (activate == 1)
	{
		
	if (goingToStart) {
	
		if point_distance(x, y+position.z, startX, startY+startZ) <= currentSpeed
		{
			currentSpeed = point_distance(x, y+position.z, startX, startY+startZ)
		}
	
		if (x == startX) && (y == startY) && (position.z == startZ)
		{
		currentSpeed = 0;
		alarm[0] = waitTime;
		waitTime = Cooldown;
		}
	
	}
	// Check if it's at ending position
	else if (!goingToStart) {
		if point_distance(x, y+position.z, endX, endY+endZ) <= currentSpeed
		{
			currentSpeed = point_distance(x, y+position.z, endX, endY+endZ)
		}
	
		if (x == endX) && (y == endY) && (position.z == endZ)
		{
		currentSpeed = 0;
		alarm[0] = waitTime;
		waitTime = Cooldown;
		}
	}

	}
	
}

else if (active_style == 5)
{
	if (activate == 1)
	{
		
	if (goingToStart) {
	
		if point_distance(x, y+position.z, startX, startY+startZ) <= currentSpeed
		{
			currentSpeed = point_distance(x, y+position.z, startX, startY+startZ)
		}
	
		if (x == startX) && (y == startY) && (position.z == startZ)
		{
		currentSpeed = 0;
		alarm[0] = waitTime;
		waitTime = Cooldown;
		}
	
	}
	// Check if it's at ending position
	else if (!goingToStart) {
		if point_distance(x, y+position.z, endX, endY+endZ) <= currentSpeed
		{
			currentSpeed = point_distance(x, y+position.z, endX, endY+endZ)
		}
	
		if (x == endX) && (y == endY) && (position.z == endZ)
		{
		currentSpeed = 0;
		alarm[0] = waitTime;
		waitTime = Cooldown;
		}
	}

	}
	
}
