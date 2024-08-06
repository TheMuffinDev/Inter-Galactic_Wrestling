///@desc Freeze
ded = true;
attacking = false;
running_to_player = false;
shake = 10;
hp = 0;
enemy_stop_walking();

sprite_index = hit_sprite;
image_index = 0;
alarm[1] = -1;

//Player Stuff
with(obj_player)
{
	state = STATES_PLAYER.freeze;
	alarm[0] = -1;
	squish(1.4,0.85);
	image_index = 0;
}

//Camera Stuff
with(obj_camera)
{
	follow = other.id;
	zoom_to = 0.6;
	increase_time = false;
	shake_screen(100,10);
}