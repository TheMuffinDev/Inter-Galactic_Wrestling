//Camera Variables
cam_width = 2564;
cam_height = 1440;
zoom = 1;
zoom_to = 1;
zoom_speed = 10;
global.player_name = "Kazuki";

//Screenshake
screenshake = 0;
screenshake_decrease = 0;

//Positioning
follow = obj_fight_control;
x = follow.x;
y = follow.y;
x_to = x;
y_to = y;
cam_speed = 15;
global.enemy_target = obj_neil;

//Timiing
increase_time = false;
timing = {
	minutes: 0,
	seconds: 0,
	miliseconds: 0
}

//Versus Icon
versus_add = 1500;
versus_add_to = 0;


//Weird Camera Stuff
camera = camera_create();
var viewmat = matrix_build_lookat(x,y,-100,x,y,0,0,1,0);
var projmat = matrix_build_projection_ortho(cam_width,cam_height,1.0,32000.0);

camera_set_view_mat(camera,viewmat);
camera_set_proj_mat(camera,projmat);

view_camera[0] = camera;