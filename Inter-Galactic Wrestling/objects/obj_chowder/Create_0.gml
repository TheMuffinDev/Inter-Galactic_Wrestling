//Inheret Event
event_inherited();




//Variables
x_speed = 0;
x_speed_change = 0;
running_to_player = false;
hit_counter = 0;
jump_attack = false;

//Sprites
hit_sprite = spr_chowder_hit;
idle_sprite = spr_chowder_idle;
air_sprite = spr_chowder_idle;
blocking_sprite = spr_chowder_block;

//Stats
hp = 175;
max_hp = hp;
health_index = 3;
versus_index = 2;
enemy_speed = 8;
moving = false;
enemy_name = "Chowder";

//Timelines
timeline_hit = tim_basic_was_hit;