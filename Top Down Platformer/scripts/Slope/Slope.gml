function Slope(_h1=0, _h2=32, _hor=0, _z=0) : Position(_h1, _z) constructor {

    self.z_height2 = _h2;
    self.face_horizontal = _hor;
    self.parent = other;
    z_top = function(src=other) {
        var _ds = 0;
        var _obj = src;
        if (is_struct(src)) {
            _obj = src.parent;
        }
		
		var _ox = (_obj.bbox_left + _obj.bbox_right) * 0.5;
        var _oy = (_obj.bbox_top + _obj.bbox_bottom) * 0.5;
		
        if (self.face_horizontal == 0) {
            _ds = (_obj.bbox_right - self.parent.bbox_left) / (self.parent.bbox_right - self.parent.bbox_left);
        } else if (self.face_horizontal == 1) {
			_ds = (_obj.bbox_top - self.parent.bbox_bottom) / (self.parent.bbox_top - self.parent.bbox_bottom);
        } else if (self.face_horizontal == 2) {
            _ds = (_obj.bbox_left - self.parent.bbox_right) / (self.parent.bbox_left - self.parent.bbox_right);
        } else if (self.face_horizontal == 3) {
			_ds = (_obj.bbox_bottom - self.parent.bbox_top) / (self.parent.bbox_bottom - self.parent.bbox_top);
        }

        _ds = clamp(_ds, 0, 1);
        var _zt = lerp(self.z_height, self.z_height2, _ds);
        return _zt + self.z;
    };
}


