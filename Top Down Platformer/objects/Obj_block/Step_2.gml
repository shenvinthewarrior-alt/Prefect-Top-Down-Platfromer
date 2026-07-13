

x += moveX;
y += moveY;
position.z += moveZ

if (disX != 0) || (disY != 0) || (disZ != 0)
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
	}
}

}

acceleration = moveZ

if (moveZ >= 0)
{
	acceleration2 = 0//currentSpeed-1
}
else
{
	acceleration2 = -currentSpeed;
}

