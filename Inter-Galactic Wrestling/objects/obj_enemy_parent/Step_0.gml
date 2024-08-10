//Getting Damaged
if(instance_place(x,y,obj_player_attack_parent)) && (hit_cooldown <= 0) && (!blocking) && (!iframes)
{
	var _damage_to_take = obj_player_attack_parent.damage;
	
	hp -= _damage_to_take;
	flashing_white = 7;
	hit_cooldown = 5;
	
	//Damage Counter
	hit_counter++;
	alarm[2] = 90;
	
	//Hit Effects and SFX
	shake_screen(40,8);
	audio_play_sound(sou_punch1,1,0,global.sfx_volume,0,random_range(0.9,1.1));
	
	//Damage Indicater
	with(instance_create_depth(x,obj_player.y,depth-1,obj_damage_indicater))
	{
		direction = point_direction(x,y,obj_player.x,obj_player.y) + 180 + random_range(40,-10);
		text = string(_damage_to_take);
	}
	
	//Hit Timeline
	if(!attacking)
	{
		initiate_timeline(timeline_hit,0,1);
		knockback_speed = obj_player_attack_parent.knockback_force;
		knockback_dir = obj_player_attack_parent.knockback_dir;
		facing = obj_player_attack_parent.knockback_dir;
	}
	else
	{
		knockback_speed = obj_player_attack_parent.knockback_force * 0.5;
		knockback_dir = obj_player_attack_parent.knockback_dir;
	}
	
	//Set target
	global.enemy_target = id;
}

//Blocking
if(instance_place(x,y,obj_player_attack_parent)) && (blocking) && (!iframes)
{
	//Damage Counter
	hit_counter++;
	alarm[2] = 90;
	
	shake_screen(100,10);
	knockback_speed = obj_player_attack_parent.knockback_force * 0.5;
	knockback_dir = obj_player_attack_parent.knockback_dir;
	obj_player.x_speed = 0;
	flashing_white = 7;
	hit_cooldown = 5;
	successfully_blocked = true;
	block_cooldown = 0;
	
	facing = obj_player_attack_parent.knockback_dir;
	
	//Sounds
	audio_play_sound(sou_block,1,0,global.sfx_volume,0,random_range(0.9,1));
}



//Cooldowns
if(flashing_white > 0)
	flashing_white--;

if(hit_cooldown > 0)
	hit_cooldown--;



//Dying
if(hp <= 0) && (!ded)
{	
	initiate_timeline(tim_enemy_death,0,1)
}


//Dead
if(ded){
	sprite_index = hit_sprite;
	if(in_air)
		display_angle_to += 2;
}


//Destroying
if(waiting_to_destroy) && (!in_air)
{
	obj_camera.follow = noone;
	image_alpha = 0;
	explode(spr_particle,1,100,[0.3,0.6],[0,359],[10,30],[-1,-1],[2,4],[5,20],c_white);
	shake_screen(100,10);
	
	//Dearh Sound
	audio_play_sound(sou_explode,1,0,global.sfx_volume,0,1);
	
	waiting_to_destroy = false;
}