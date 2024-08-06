// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_punch(){
	
if(instance_exists(global.enemy_target)) && (global.enemy_target != noone)
	look_at(global.enemy_target);

state = STATES_PLAYER.attacking;
sprite_index = spr_player_punch;
attack_phase++;
attack_cooldown = 10;
image_index = attack_phase;
alarm[0] = attack_speed;
alarm[1] = attack_speed*1.5;

x_speed = 30;
squish(1.4,0.85);

if(image_index == 2)
{
	//Wombo Combo
	alarm[0] = attack_speed;
	attack_cooldown = 20;
	attack_phase = -1;
	audio_play_sound(sou_swing2,1,0,global.sfx_volume,0,random_range(0.95,1.05));
	var _facing = facing;
	with(instance_create_depth(x,y,depth-1,obj_player_punch_hitbox))
	{
		image_xscale = _facing;
		damage = 5 + irandom_range(1,-1);
		knockback_force = 35;
		knockback_dir = _facing * -1;
	}
}else{
	//Normal Punch
	audio_play_sound(sou_swing1,1,0,global.sfx_volume,0,random_range(0.95,1.05));
	var _facing = facing;
	with(instance_create_depth(x,y,depth-1,obj_player_punch_hitbox))
	{
		image_xscale = _facing;
		damage = 5 + irandom_range(1,-1);
		knockback_force = 16;
		knockback_dir = _facing * -1;
	}
}

}