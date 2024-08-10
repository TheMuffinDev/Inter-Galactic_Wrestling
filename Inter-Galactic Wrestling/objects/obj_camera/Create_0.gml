//Camera Variables
cam_width = 2564;
cam_height = 1440;
zoom = 1;
zoom_to = 1;
zoom_speed = 10;
x_to = x;
y_to = y;
cam_speed = 15;
global.player_name = "Kazuki";
global.enemy_target = obj_enemy_parent;

//Screenshake
screenshake = 0;
screenshake_decrease = 0;

//Screen Darkness
screen_darkness = 0;
screen_fade = "none";

//Hub World
if(room == room_hub)
{
	follow = obj_player;
	screen_fade = "fade in";
	screen_darkness = 1;
	cam_speed = 10;
	x = obj_player.x;
	y = -50;
}

//Arena
if(room == room_arena)
{
	follow = obj_fight_control;
	x = follow.x;
	y = follow.y;
	screen_fade = "fade in";
	screen_darkness = 1;
	
	//Timing
	global.timing = {
		minutes: 0,
		seconds: 0,
		miliseconds: 0
	}
}

//Results
if(room == room_results)
{
	follow = noone;
	screen_fade = "fade in";
	screen_darkness = 1;
	x = room_width/2;
	y = room_height/2;
	initiate_timeline(tim_results,0,1);
	
	display_add0 = -1500;
	display_add1 = -1500;
	display_add2 = -1500;
	display_add3 = -1500;
	display_add4 = -2500;
	display_add5 = -1500;
	display_add0_to = -1500;
	display_add1_to = -1500;
	display_add2_to = -1500;
	display_add3_to = -1500;
	display_add4_to = -2500;
	display_add5_to = -1500;
	black_add = 0;
	black_add_increase = 0;
}

//Mutations
if(room == room_mutations)
{
	follow = noone;
	screen_fade = "fade in";
	screen_darkness = 1;
	black_add = 0;
	black_add_increase = 0;
	display_add1 = -1500;
	display_add1_to = 0;
	x = room_width/2;
	y = room_height/2;
}

//Timiing
increase_time = false;

//Versus Icon
versus_add = 1500;
versus_add_to = 1500;

//Display
audience_rating = 0;

//Menu
can_continue = false;
menu_on = "none";
selected = [0,0];



//Weird Camera Stuff
camera = camera_create();
var viewmat = matrix_build_lookat(x,y,-100,x,y,0,0,1,0);
var projmat = matrix_build_projection_ortho(cam_width,cam_height,1.0,32000.0);

camera_set_view_mat(camera,viewmat);
camera_set_proj_mat(camera,projmat);

view_camera[0] = camera;