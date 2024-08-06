///@desc Enemy Flies Back
enemy_jump(-35,"none");
shake_screen(100,10);

knockback_speed = 50;
flashing_white = 1000;
waiting_to_destroy = true;

//KO Sound
audio_play_sound(sou_ko_punch,1,0,global.sfx_volume,0,1);

//Player Stuff
with(obj_player)
{
	squish(1.4,0.85);
	image_index++;
	x_speed = 55;
}