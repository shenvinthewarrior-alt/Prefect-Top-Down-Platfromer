depth = -9999999999999999999

if instance_exists(Obj_enemy)
{
global.leaders = ds_map_create();

global.cell_size = 64;
global.max_spd_cap = 32;
global.cell_width = (room_width / global.cell_size)+1
global.cell_height = (room_height / global.cell_size)+1
global.regrid = -(global.cell_size/2)

// how many z bands you want (band = floor(z / band_size))
global.z_band_size = 32; // adjust as needed
global.max_z = 3200;

global.jump_types = [150];

// Loop all existing enemies in the room

// Calculate grid array dimensions
var z_band_count = (global.max_z div global.z_band_size) + 1;
var jump_count   = array_length(global.jump_types);

// Create 2D array of grids
global.grid = array_create(z_band_count);

for (var z_band = 0; z_band < z_band_count; z_band++) {
    global.grid[z_band] = array_create(jump_count);

    for (var j = 0; j < jump_count; j++) {
        global.grid[z_band][j] = mp_grid_create(global.regrid,global.regrid,global.cell_width,global.cell_height,global.cell_size,global.cell_size)
    }
}

}