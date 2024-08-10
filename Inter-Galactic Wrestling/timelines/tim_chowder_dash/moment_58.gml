///@desc Punch
image_index = 1;
x_speed = 30;
x_speed_change = -2.5;

squish(1.3,0.8);

audio_play_sound(sou_swing2,1,0,global.sfx_volume,0,random_range(0.95,1.05));


//Punch
var _facing = facing;
with(instance_create_depth(x,y,depth-1,obj_enemy_punch_hitbox))
{
	image_xscale = _facing;
	image_index = 3;
	damage = 10 + irandom_range(2,-1);
	knockback_force = 40;
	knockback_dir = _facing * -1;
}