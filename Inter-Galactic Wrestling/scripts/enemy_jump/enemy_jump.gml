// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function enemy_jump(_jump_force,_jump_sound){

in_air = true;
y--;
y_speed = _jump_force;

display_angle_to = 0;
alarm[0] = -1;
squish(1.3,0.75);

//Jump Sound
if(_jump_sound != "none")
	audio_play_sound(_jump_sound,1,0,global.sfx_volume,0,random_range(2.2,2.4));

}