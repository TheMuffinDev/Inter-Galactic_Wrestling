///@desc 1
with(instance_create_depth(x,y-450,depth-1,obj_damage_indicater))
{
	direction = 270;
	speed = 30;
	alarm[0] = 15;
	image_blend = make_color_hsv(50,100,255);
	text = "1";
	font = font_fancy;
	scale = 4;
	outline_width = 4;
}


//Camera Stuff
with(obj_camera)
{
	zoom_to -= 0.05;
}

audio_play_sound(sou_swing2,1,0,global.sfx_volume,0,1);