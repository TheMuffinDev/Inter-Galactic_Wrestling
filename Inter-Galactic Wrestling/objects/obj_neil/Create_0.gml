//Inheret Event
event_inherited();




//Variables
x_speed = 0;
x_speed_change = 0;
running_to_player = false;
hit_counter = 0;

//Sprites
hit_sprite = spr_neil_hit;
idle_sprite = spr_neil_idle;
air_sprite = spr_neil_in_air;
moving_sprite = spr_neil_moving;
blocking_sprite = spr_neil_block;

//Stats
hp = 150;
max_hp = hp;
health_index = 2;
versus_index = 1;
enemy_speed = 8;
moving = false;
enemy_name = "Niel";

//Timelines
timeline_hit = tim_basic_was_hit;