//Inheret Event
event_inherited();



//Getting Pushed Back
if(knockback_speed > 0)
{
	if(!instance_place(x - knockback_speed * knockback_dir,y,obj_collision))
		x -= knockback_speed * knockback_dir;
	knockback_speed -= 2;
}


//Falling
if(!instance_place(x,y+1,obj_collision))
{
	//Falling
	if(!instance_place(x,y+y_speed,obj_collision))
	{
		y += y_speed;
		in_air = true;
		if(!ded)
			display_angle_to = 0;
		alarm[2] = -1;
		sprite_index = air_sprite;
	}
	else
	{
		//Hitting the Ground
		y = round(y)
		while(!instance_place(x,y+1,obj_collision))
			y += 0.1;
		in_air = false;
		y_speed = 0;
		sprite_index = idle_sprite;
		
		if(moving)
			enemy_start_walking(facing);
		
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
}


//Walking
if(moving) && (!in_air)
{
	if(!instance_place(x + enemy_speed * facing * 2,y,obj_collision))
		x += enemy_speed * facing;
}

if(moving) && (in_air) && (!ded)
{
	if(!instance_place(x + enemy_speed * facing * 2,y,obj_collision))
		x += enemy_speed * facing * 2;
}


//X Speed
if(!instance_place(x + x_speed * facing,y,obj_collision))
	x += x_speed * facing;
x_speed += x_speed_change;

if(x_speed_change > 0) && (x_speed >= 0)
{
	x_speed = 0;
	x_speed_change = 0;
}

if(x_speed_change < 0) && (x_speed <= 0)
{
	x_speed = 0;
	x_speed_change = 0;
}


//Run To Player
if(running_to_player)
{
	look_at(obj_player);
	
	if(abs(x - obj_player.x) <= 500)
	timeline_speed = 1;
}


//Blocking
if(!ded)
{
	if(hit_counter >= 3) && (blocking = false) && (!attacking)
	{
		blocking = true;
		sprite_index = blocking_sprite;
		initiate_timeline(choose(tim_neil_punch,tim_neil_punch_once,tim_neil_jump),-30,1);
		squish(1.2,0.8);
		
		alarm[1] = -1;
	}
	
	
	if(instance_place(x,y,obj_player_attack_parent)) && (blocking) && (hit_counter < 5)
	{
		sprite_index = blocking_sprite;
		initiate_timeline(choose(tim_neil_punch,tim_neil_punch_once,tim_neil_jump),-30,1);
		squish(1.2,0.8);
	}
}