image_alpha = 1
image_moving = 0;
localFrame = 0;
sprite_moving = sprite_index;
anim_checker = 0;

anim_dir = 0;
jump_count = 0;

target = Obj_player
attack_target = Obj_player
attack_stage = false;

init_zaxis(,Zpos);
/// create vector to handle movement in 2d
motion = new Vector2();
move_spd = 2
flyable = 0;
fly_spd = move_spd;
pushwidth = 5;
pushX = 0;
pushY = 0;
StackPush = 0;
wasPushing = 0;
PushHeavy = 0;
max_spd = move_spd;
actual_jump = 0
jump_spd = 12
max_jump = jump_spd*12.5
jump_dis = max_jump
/// state machine
randomize()
state = player_state_normal;
ladder_object = noone;
state_timer = 0;

//position.z_height = 32;

xspd = 0;
yspd = 0;
dir = 0;
target_x = 0//obj_player.x
target_y = 0//obj_player.y
attack_timer = 0;
mis_dir_create = Equal_prng_create(7,1);
mis_dir = 0//choose(90,45,0,-45,-90);
dirn = 0;
rolled_once = 0;
rolled_time = 0;
rolled_random_create = Equal_prng_create(5,1);
rolled_random = 0//choose(60,120,180,240,300);

target_xoffset = 0;
target_yoffset = 0;
target_z = 0;
voidAllow = 0;

snapping = 0;
variant_jump = 0;

path = path_add();
pathable = 0
checked = noone
/*disX = 0;
disY = 0;*/
stop_gamble = false
gamble = irandom_range(0,1)
checker = 0;
check_inst = 0;
Length_test = -1;
dist_ = 0;
xxxxx = 0;
yyyyy = 0;
dir_ = 0;

tester = 0;