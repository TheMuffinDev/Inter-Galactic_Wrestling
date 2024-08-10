//Variables
can_attack = true;
attack_again = false;
attack_speed = 20;
attack_phase = -1;

attack_cooldown = 0;
block_cooldown = 00;
blocking = false;
successfully_blocked = false;

moving = false;
player_speed = 11;
frozen_in_place = false;
walk_speed = 15;

dodging = false;
dodge_cooldown = 0;
dodge_direction = 1;
x_speed = 0;
iframes = false;

y_speed = 0;
grav = 1.5;
in_air = false;

facing = 1;
display_xscale = 1;
display_yscale = 1;
display_xscale_to = 1;
display_yscale_to = 1;
display_angle = 0;
display_angle_to = 0;

knockback_speed = 0;
knockback_dir = 1;

hit_cooldown = 0;
flashing_white = 0;
global.player_hit_counter = 0;

freeze_x = x;

//Stat Variables
hp = 100;
damage = 10;
combo_damage = 20;


//States
enum STATES_PLAYER
{
	idle,
	walking,
	in_air,
	blocking,
	dodging,
	attacking,
	freeze
}

state = STATES_PLAYER.idle;