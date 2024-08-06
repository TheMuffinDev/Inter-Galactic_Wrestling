// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function enemy_stop_walking(){

alarm[0] = -1;
display_angle_to = 0;
moving = false;
sprite_index = idle_sprite;
squish(1.2,0.85);

}