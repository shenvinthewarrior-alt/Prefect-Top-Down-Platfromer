function character_can_move(_vx, _vy, _push_power, Obj) {
	var _target = instance_place(x + (_vx*2), y + (_vy*2), Obj);

    if (_target != noone) && (_target != id) {
        if (_push_power > 0) {
            // Try to push the object
            var can_push = false;
            with (_target) {
                can_push = character_can_move(_vx, _vy, _push_power - 1, Obj);
            }//abs()
            if (can_push) {
				with(_target)
				{
                x += _vx;
                y += _vy;
				}
                return true;
            } else {
                return false; // object can't move
            }
        } else {
            return false; // no push power left
        }
    } else {
		var coll = instance_place(x+ (_vx*2),y+ (_vy*2),Obj_block)
		if (coll)
		{
			return false;
		}
        else
		{
			x += _vx;
			y += _vy;
			return true;
		}
    }
}