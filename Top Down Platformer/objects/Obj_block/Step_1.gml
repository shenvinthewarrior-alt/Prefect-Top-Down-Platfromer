
if (disX != 0) || (disY != 0) || (disZ != 0)
{
var _targetX = endX, _targetY = endY, _targetZ = endZ;
if (goingToStart) {
	_targetX = startX;
	_targetY = startY;
	_targetZ = startZ;
}

// Set movement
moveX = sign(_targetX - x) * currentSpeed;
moveY = sign(_targetY - y) * currentSpeed;
moveZ = sign(_targetZ - position.z) * currentSpeed;
}
