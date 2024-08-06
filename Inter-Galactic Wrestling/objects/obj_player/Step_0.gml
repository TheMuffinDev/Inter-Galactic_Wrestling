//Player States
switch(state) {
	//Idle
	case STATES_PLAYER.idle:
	
	sprite_index = spr_player_idle;
	image_speed = 1;
	
	break;
	
	//Walking
	case STATES_PLAYER.walking:
	
	sprite_index = spr_player_walking;
	
	break;
	
	//Blocking
	case STATES_PLAYER.blocking:
	
	sprite_index = spr_player_blocking;
	image_index = 0;
	
	break;
	
	//Dodging
	case STATES_PLAYER.dodging:
	
	sprite_index = spr_player_dodge;
	image_index = 0;
	x_speed -= 3.5;
	if(x_speed > 0) && (!instance_place(x + x_speed * dodge_direction,y,obj_collision))
		x += x_speed * dodge_direction;
	
	break;
	
	//In Air
	case STATES_PLAYER.in_air:
	
	sprite_index = spr_player_in_air;
	
	break;
	
	//Attacking
	case STATES_PLAYER.attacking:
	
	x_speed -= 3;
	if(x_speed > 0) && (!instance_place(x + x_speed * facing,y,obj_collision))
		x += x_speed * facing;
	
	break;
	
	//Freeze
	case STATES_PLAYER.freeze:
	
	x_speed -= 3.5;
	if(x_speed > 0) && (!instance_place(x + x_speed * facing,y,obj_collision))
		x += x_speed * facing;
	
	break;
}



//Movement
if(state = STATES_PLAYER.idle) || (state = STATES_PLAYER.walking)
{
	if(keyboard_check(vk_right)) && (knockback_speed <= 0)
	{
		//Movement Animation
		facing = 1;
		if(moving == false)
		{
			state = STATES_PLAYER.walking;
			alarm[2] = 1;
		}
		moving = true;
		
		//Actually Moving Right
		if(!instance_place(x+player_speed,y,obj_collision)) && (knockback_speed <= 0)
		{
			x += player_speed;
		}
	}
	else if(keyboard_check(vk_left))
	{
		//Movement Animation
		facing = -1;
		if(moving == false)
		{
			state = STATES_PLAYER.walking;
			alarm[2] = 1;
		}
		moving = true;
		
		//Actually Moving Left
		if(!instance_place(x-player_speed,y,obj_collision))
		{
			x -= player_speed;
		}
	}
		else
	{
		//Stopping
		if(moving == true)
		{
			state = STATES_PLAYER.idle;
			alarm[2] = -1;
			display_angle_to = 0;
			squish(1.2,0.85);
		}
		moving = false;
	}
}



//Blocking
if((state = STATES_PLAYER.idle) || (state = STATES_PLAYER.walking)) && (block_cooldown <= 0)
{
	if(keyboard_check_pressed(ord("Z"))) && (knockback_speed <= 0)
	{
		if(instance_exists(global.enemy_target)) && (global.enemy_target != noone)
			look_at(global.enemy_target);
	
		state = STATES_PLAYER.blocking;
		block_cooldown = 45;
		blocking = true;
		squish(1.4,0.85);
		sprite_index = spr_player_blocking;
		
		alarm[2] = -1;
		display_angle_to = 0;
		moving = false;
		
		alarm[0] = 15;
	}
}



//Dodging
if((state = STATES_PLAYER.idle) || (state = STATES_PLAYER.walking) || (state = STATES_PLAYER.attacking)) && (dodge_cooldown <= 0)
{
	if(keyboard_check_pressed(ord("C"))) && (knockback_speed <= 0)
	{
		//Dodge Direction
		if(keyboard_check(vk_right))
			dodge_direction = 1;
		else if(keyboard_check(vk_left))
			dodge_direction = -1;
		else
			dodge_direction = facing;
		
		state = STATES_PLAYER.dodging;
		dodge_cooldown = 55;
		squish(1.4,0.85);
		sprite_index = spr_player_dodge;
		
		alarm[2] = -1;
		display_angle_to = 0;
		moving = false;
		x_speed = player_speed * 6;
		iframes = true;
		
		alarm[0] = 25;
		alarm[3] = 15;
		image_alpha = 0.5;
	}
}



//Falling
if(!instance_place(x,y+1,obj_collision))
{
	//Falling
	if(!instance_place(x,y+y_speed,obj_collision))
	{
		y += y_speed;
		in_air = true;
		state = STATES_PLAYER.in_air;
		display_angle_to = 0;
		moving = false;
		alarm[2] = -1;
	}
	else
	{
		//Hitting the Ground
		y = round(y)
		while(!instance_place(x,y+1,obj_collision))
			y += 0.1;
		in_air = false;
		state = STATES_PLAYER.idle;
		y_speed = 0;
		sprite_index = spr_player_idle;
		squish(1.2,0.85);
	}
	
	//Gravity
	if(abs(y_speed) < 5)
	{
		y_speed += grav*(abs(y_speed)*0.2)
		if(y_speed < 0.2) && (y_speed > -0.2)
			y_speed += 0.5;
	}
	else
	{
		y_speed += grav;
		y_speed = round(y_speed)
	}
	
	//Moving in Air
	if(keyboard_check(vk_right)) && (!instance_place(x+player_speed,y,obj_collision))
	{
		x += player_speed;
	}
	
	if(keyboard_check(vk_left)) && (!instance_place(x-player_speed,y,obj_collision))
	{
		x -= player_speed;
	}
}



//Jumping
if(state = STATES_PLAYER.idle) || (state = STATES_PLAYER.walking)
{
	if(keyboard_check_pressed(vk_up)) && (!in_air) && (knockback_speed <= 0)
	{
		in_air = true;
		state = STATES_PLAYER.in_air;
		y--;
		y_speed = -35;
		
		display_angle_to = 0;
		moving = false;
		alarm[2] = -1;
		squish(1.3,0.75);
		
		//Jump Sound
		audio_play_sound(sou_jump,1,0,global.sfx_volume,0,random_range(2.2,2.4));
	}
}



//Getting Pushed Back
if(knockback_speed > 0)
{
	if(!instance_place(x - knockback_speed * knockback_dir,y,obj_collision))
		x -= knockback_speed * knockback_dir;
	if(!successfully_blocked)
		sprite_index = spr_player_dodge;
	knockback_speed -= 2;
}



//Cooldowns
if(attack_cooldown > 0)
	attack_cooldown--;

if(block_cooldown > 0)
	block_cooldown--;

if(dodge_cooldown > 0)
	dodge_cooldown--;

if(hit_cooldown > 0)
	hit_cooldown--;

if(flashing_white > 0)
	flashing_white--;



//Attacking
if(keyboard_check_pressed(ord("X"))) && (attack_cooldown <= 0) && (can_attack = true) && (knockback_speed <= 0)
{
	if(state = STATES_PLAYER.idle) || (state = STATES_PLAYER.walking)
	{
		player_punch();
		
		alarm[2] = -1;
		display_angle_to = 0;
		moving = false;
	}
	else if(state = STATES_PLAYER.attacking)
	{
		player_punch();
	}
}


//Checking if Blocked
/*
if(instance_exists(obj_enemy_punch_hitbox))
{
	var _blocked = false;
	if(blocking) && (facing == sign(obj_enemy_punch_hitbox.x - x))
		_blocked = true;
}
*/


//Getting Hit
if(instance_place(x,y,obj_enemy_punch_hitbox)) && (hit_cooldown <= 0) && (!iframes) && (!blocking)
{	
	var _damage_to_take = obj_enemy_punch_hitbox.damage;
	
	hp -= _damage_to_take;
	flashing_white = 7;
	hit_cooldown = 5;
	knockback_speed = obj_enemy_punch_hitbox.knockback_force;
	knockback_dir = obj_enemy_punch_hitbox.knockback_dir;
	facing = obj_enemy_punch_hitbox.knockback_dir;
	successfully_blocked = false;
	
	//Hit Effects and SFX
	shake_screen(40,8);
	audio_play_sound(sou_punch1,1,0,global.sfx_volume,0,random_range(0.9,1.1));
	
	//Damage Indicater
	with(instance_create_depth(x,y,depth-1,obj_damage_indicater))
	{
		direction = point_direction(x,y,global.enemy_target.x,global.enemy_target.y) + 180 + random_range(40,-10);
		image_blend = make_color_hsv(0,150,255);
		text = string(_damage_to_take);
	}
}

//Blocking
if(instance_place(x,y,obj_enemy_punch_hitbox)) && (blocking)
{
	shake_screen(100,10);
	knockback_speed = obj_enemy_punch_hitbox.knockback_force * 0.7;
	knockback_dir = obj_enemy_punch_hitbox.knockback_dir;
	flashing_white = 7;
	hit_cooldown = 5;
	successfully_blocked = true;
	block_cooldown = 0;
	
	alarm[0] = 10;
	
	//Sounds
	audio_play_sound(sou_block,1,0,global.sfx_volume,0,random_range(0.9,1));
}

//Facing Target
if(global.enemy_target != noone) && (instance_exists(global.enemy_target))
{
	if(state = STATES_PLAYER.idle) || (state = STATES_PLAYER.walking) || (state = STATES_PLAYER.in_air) || (state = STATES_PLAYER.dodging)
		look_at(global.enemy_target);
}


//Frozen In Place
if(frozen_in_place)
{
	state = STATES_PLAYER.freeze;
	facing = 1;
	moving = false;
	x = freeze_x;
}