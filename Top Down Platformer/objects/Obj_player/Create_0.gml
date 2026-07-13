//create
image_moving = 0;
localFrame = 0;
sprite_moving = 0;
anim_checker = 0;

unstuck = 0;
unstckX = 0;
unstckY = 0;

pushable = 0;
anim_dir = 0;
jump_count = 0;
attack = false;
attack_coll = noone;
/// create position struct to handle z-movement
init_zaxis(/*bbox_left+12,bbox_top,bbox_right-12,bbox_bottom*/,Zpos);
/// create vector to handle movement in 2d
motion = new Vector2();
run_spd = 4
walk_spd = 1
move_spd = 0;

accr_xspd = 0;
accr_yspd = 0;
accr_xspd2 = 0;
accr_yspd2 = 0;

flyable = 0;
fly_spd = move_spd;
max_spd = move_spd
_push_power = 10;
/// state machine
jump_spd = 12
max_jump = jump_spd*12.5
jump_dis = max_jump
state = player_state_normal;
ladder_object = noone;
state_timer = 0;
dir = 0;
position.z_height = 88//116//128-12;

debug_test = false;
actual_jump = 0;
//game_set_speed(30,gamespeed_fps)
text = 0;