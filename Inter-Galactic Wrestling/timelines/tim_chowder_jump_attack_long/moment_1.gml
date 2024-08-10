///@Smash
jump_attack = false;
enemy_speed = 8;
moving = false;

squish(1.3,0.75);
shake_screen(120,10);

sprite_index = spr_chowder_hammer;
image_index = 1;

audio_play_sound(sou_hammer,1,0,global.sfx_volume,0,random_range(0.95,1.05));


//Punch
var _facing = facing;
with(instance_create_depth(x,y,depth-1,obj_enemy_punch_hitbox))
{
	image_xscale = _facing;
	image_index = 1;
	damage = 15 + irandom_range(3,-2);
	knockback_force = 50;
	knockback_dir = _facing * -1;
}