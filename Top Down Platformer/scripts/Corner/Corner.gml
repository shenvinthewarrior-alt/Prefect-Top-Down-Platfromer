function Corner(_x,_y,b,LT,LD,RT,RD,TR,TL,DR,DL){
if 
(LT == noone || (!(LT.bbox_top == b.bbox_top  && point_in_rectangle(_x,_y,LT.bbox_left,LT.bbox_top-64,LT.bbox_left+64,LT.bbox_top)  && (LT.position.z <= b.position.z+b.position.z_height || b.position.z+b.position.z_height <= position.z)))) // LT
&&
(LD == noone || (!(LD.bbox_bottom == b.bbox_bottom && point_in_rectangle(_x,_y,LD.bbox_left,LD.bbox_bottom,LD.bbox_left+64,LD.bbox_bottom+64) && (LD.position.z <= b.position.z+b.position.z_height || b.position.z+b.position.z_height <= position.z)))) //LD
&&
(RT == noone || (!(RT.bbox_top == b.bbox_top && point_in_rectangle(_x,_y,RT.bbox_right-64,RT.bbox_top-64,RT.bbox_right,RT.bbox_top) && (RT.position.z <= b.position.z+b.position.z_height || b.position.z+b.position.z_height <= position.z)))) // RT
&&
(RD == noone || (!(RD.bbox_bottom == b.bbox_bottom && point_in_rectangle(_x,_y,RD.bbox_right-64,RD.bbox_bottom,RD.bbox_right,RD.bbox_bottom+64) && (RD.position.z <= b.position.z+b.position.z_height || b.position.z+b.position.z_height <= position.z)))) //RD
&&
(TR == noone || (!(TR.bbox_right == b.bbox_right && point_in_rectangle(_x,_y,TR.bbox_right,TR.bbox_bottom-64,TR.bbox_right+64,TR.bbox_bottom) && (TR.position.z <= b.position.z+b.position.z_height || b.position.z+b.position.z_height <= position.z)))) // TR
&&
(TL == noone || (!(TL.bbox_left == b.bbox_left && point_in_rectangle(_x,_y,TL.bbox_left-64,TL.bbox_bottom-64,TL.bbox_left,TL.bbox_bottom) && (TL.position.z <= b.position.z+b.position.z_height || b.position.z+b.position.z_height <= position.z)))) //TL
&&
(DR == noone || (!(DR.bbox_right == b.bbox_right && point_in_rectangle(_x,_y,DR.bbox_right,DR.bbox_top,DR.bbox_right+64,DR.bbox_top+64) && (DR.position.z <= b.position.z+b.position.z_height || b.position.z+b.position.z_height <= position.z)))) // DR
&&
(DL == noone || (!(DL.bbox_left == b.bbox_left && point_in_rectangle(_x,_y,DL.bbox_left-64,DL.bbox_top,DL.bbox_left,DL.bbox_top+64) && (DL.position.z <= b.position.z+b.position.z_height || b.position.z+b.position.z_height <= position.z)))) //DL
{
	return true
}
else
{
	return false
}

}