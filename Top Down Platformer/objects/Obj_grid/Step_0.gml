//Step
if instance_exists(Obj_enemy)
{
var all_z_cases = [];

with (Obj_enemy)
{
    if (!array_contains(all_z_cases, z_case))
    {
        array_push(all_z_cases, z_case);
    }
}

for (var i = 0; i < array_length(all_z_cases); i++)
{
    var z = all_z_cases[i];
    
    var enemies_in_layer = [];
    with (Obj_enemy)
    {
        if (z_case == z)
        {
            array_push(enemies_in_layer, id);
        }
    }

    if (!ds_map_exists(global.leaders, z) || !instance_exists(global.leaders[? z]))
    {
        if (array_length(enemies_in_layer) > 0)
        {
            global.leaders[? z] = enemies_in_layer[0];
            enemies_in_layer[0].leader = true;
        }
    }
    else
    {
        var current_leader = global.leaders[? z];
        if (current_leader.z_case != z)
        {
            // Leader left the layer → pick new leader
            if (array_length(enemies_in_layer) > 0)
            {
                global.leaders[? z] = enemies_in_layer[0];
                enemies_in_layer[0].leader = true;
            }
            else
            {
                ds_map_delete(global.leaders, z);
            }
        }
    }
}

var z_band_count = array_length(global.grid);
var jump_count   = array_length(global.jump_types);

// Clear all grids
for (var z_band = 0; z_band < z_band_count; z_band++) {
    for (var j = 0; j < jump_count; j++) {
        mp_grid_clear_all(global.grid[z_band][j]);
    }
}

// Collect all obstacles

var need_inst3 = noone
var make_list = ds_list_create()
var make_space = collision_rectangle_list(Obj_enemy.bbox_left-65, Obj_enemy.bbox_top-65,Obj_enemy.bbox_right+65, Obj_enemy.bbox_bottom+65, Obj_block, false, true, make_list, false);
var insty = noone
if (make_space > 0) {
//need_inst = global.make_list[| 0]
for (var i = 0; i < make_space; i++) {
	insty = make_list[| i];
	if (insty.position.z > Obj_enemy.position.z)
	{
		need_inst3 = insty;
	}
}
}

ds_list_destroy(make_list)
var mylist = ds_list_create()
var count = collision_rectangle_list(0, 0, room_width, room_height, Obj_block, false, true, mylist, false);

// Rebuild each grid
if (count > 0)
{
for (var i = 0; i < count; i++) {
    var inst = mylist[| i];

    var cx  = inst.bbox_left;
    var cy  = inst.bbox_top;
    var cx1 = inst.bbox_right-64;
    var cy1 = inst.bbox_bottom-64;
	
	for (var z_band = 0; z_band < z_band_count; z_band++) {
        var z_base = z_band * global.z_band_size;

        for (var j = 0; j < jump_count; j++) {
            var jump_height = global.jump_types[j];

            var enemy_top = z_base + 150;
            var obj_top   = inst.position.z + inst.position.z_height;
			
			var coll = collision_rectangle(inst.bbox_left,inst.bbox_top,inst.bbox_right,inst.bbox_bottom,Obj_ladder,false,true)
			
            // block if enemy can't jump over
            if (enemy_top < obj_top && z_base >= inst.position.z && (coll == noone || (inst.instyyy != noone && coll != inst.instyyy) ) ) || 
			(need_inst3 != noone && collision_rectangle(need_inst3.bbox_left-1,need_inst3.bbox_top-1,need_inst3.bbox_right+1,need_inst3.bbox_bottom+1,inst,false,true)
			&& inst.position.z+inst.position.z_height >= Obj_enemy.position.z_ground
			&& inst.position.z == Obj_enemy.position.z_ground
			&& need_inst3.position.z <= inst.position.z+inst.position.z_height
			){
                mp_grid_add_rectangle(global.grid[z_band][j], cx, cy, cx1, cy1);
            }
			
		}
    }

}
}
ds_list_destroy(mylist)

var mylist2 = ds_list_create()
var count2 = collision_rectangle_list(0, 0, room_width, room_height, Obj_void, false, true, mylist2, false);

// Rebuild each grid
if (count2 > 0)
{
for (var i = 0; i < count2; i++) {
    var inst = global.mylist2[| i];

    var cx  = inst.bbox_left;
    var cy  = inst.bbox_top;
    var cx1 = inst.bbox_right-64;
    var cy1 = inst.bbox_bottom-64;

    for (var z_band = 0; z_band < z_band_count; z_band++) {
        var z_base = z_band * global.z_band_size;

        for (var j = 0; j < jump_count; j++) {
            var jump_height = global.jump_types[j];

            var enemy_top = z_base + 150;
            var obj_top   = 0 + 320;

            // block if enemy can't jump over
            if (enemy_top < obj_top && z_base >= 0) && (inst.image_xscale > 2 && inst.image_yscale > 2){
                mp_grid_add_rectangle(global.grid[z_band][j], cx, cy, cx1, cy1);
            }
        }
    }
}
}

ds_list_destroy(mylist2)


}