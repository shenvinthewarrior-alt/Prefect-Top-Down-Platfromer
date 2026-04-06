function Vector2(vx = 0, vy = 0) constructor{
    self.x = vx;
    self.y = vy;
    static normalize = function(){
        var dis = self.length();
        if(dis == 0){
            return;    
        }
        self.x /= dis;
        self.y /= dis;
    };
    static length = function(){
        return(point_distance(0,0,self.x,self.y));
    };
	static set_length = function(new_length){
		normalize();
		self.x *= new_length;
		self.y *= new_length;
	};
}