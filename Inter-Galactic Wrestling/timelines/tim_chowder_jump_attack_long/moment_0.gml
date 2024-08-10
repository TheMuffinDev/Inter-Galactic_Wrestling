///@desc Jump
moving = true;
attacking = true;

alarm[2] = -1;
hit_counter = 0;
blocking = false;

look_at(obj_player);
enemy_jump(-35,sou_jump);

timeline_speed = 0;
jump_attack = true;

sprite_index = spr_chowder_hammer;
image_index = 2;

enemy_speed = 16;
moving = true;