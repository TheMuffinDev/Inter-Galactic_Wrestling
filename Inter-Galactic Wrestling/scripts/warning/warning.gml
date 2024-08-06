// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function warning(_text,_color){

//Outline
//outline_width = 30;
//outline_color = _color;

//Damage Indicater
with(instance_create_depth(x,y-sprite_height/2,depth-1,obj_damage_indicater))
{
	direction = 90;
	speed = 25;
	alarm[0] = 15;
	text = _text;
	scale = 2;
}

//Sounds
audio_play_sound(sou_warning,1,0,global.sfx_volume,0,random_range(1.45,1.55));

}