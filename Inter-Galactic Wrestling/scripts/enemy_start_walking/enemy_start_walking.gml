// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function enemy_start_walking(_dir){

facing = _dir;
moving = true;
sprite_index = moving_sprite;
image_index = 0;
alarm[0] = 1;

}