//Variables
image_index = irandom_range(0,8);
alarm[0] = random_range(1,90);

facing = 1;
your_display_xscale = 1;
your_display_yscale = 1;
your_display_xscale_to = 1;
your_display_yscale_to = 1;
your_display_angle = 0;
your_display_angle_to = 0;

if(instance_exists(obj_fight_control))
	look_at(obj_fight_control);
else
	look_at(obj_player);

//Positioning
your_og_x = x;
your_og_y = y;
keep_jumping = false;

y_speed = 0;
grav = random_range(1.2,1.8);
in_air = false;