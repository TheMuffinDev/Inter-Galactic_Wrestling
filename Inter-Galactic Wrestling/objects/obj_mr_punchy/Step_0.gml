//Getting Damaged
if(instance_place(x,y,obj_player_attack_parent)) && (hit_cooldown <= 0)
{
	var _damage_to_take = obj_player_attack_parent.damage;
	
	hp -= _damage_to_take;
	flashing_white = 7;
	hit_cooldown = 5;
	turn_speed = 5;
	turning = true;
	turn_dir = obj_player.facing;
	
	//Hit Effects and SFX
	shake_screen(40,8);
	audio_play_sound(sou_punch1,1,0,global.sfx_volume,0,random_range(0.9,1.1));
	
	//Damage Indicater
	with(instance_create_depth(x,obj_player.y,depth-1,obj_damage_indicater))
	{
		direction = point_direction(x,y,obj_player.x,obj_player.y) + 180 + random_range(40,-10);
		text = string(_damage_to_take);
	}
	
	//Set target
	global.enemy_target = id;
}

//Cooldowns
if(flashing_white > 0)
	flashing_white--;

if(hit_cooldown > 0)
	hit_cooldown--;