image_speed = 0;
//CCC = 0;
//hitted = 1;
depther = 0;
depth_buffed = 0;
jump_dis = 0;
Zheight_cal = Zheight+32
if (object_index != Obj_stair)
{
check = 0;
init_zaxis(Zheight_cal-32,Zpos);
}
else
{
if (Zpos != 0)
{
	Zpos -= 32
	Zheight_cal += 32
}
check = 1;//,Zheight_cal-32+Zpos
pos1 = Zheight_cal-64//+Zpos
pos2 = Zheight_cal-32//+Zpos
init_zaxis_slope(pos1,pos2,image_index,Zpos);
}

platformSpeed = 1;
currentSpeed = 1;
moveX = 0;
moveY = 0;
moveZ = 0;
pushX = 0;
pushY = 0;
StackPush = 0;
add_stack = 1;

goingToStart = false;
waitTime = 60;

startX = x
startY = y
startZ = position.z

endX = x + disX
endY = y + disY
endZ = position.z +disZ

acceleration = 0;
acceleration2 = 0;

instyyy = noone
vis_yscale = 0;