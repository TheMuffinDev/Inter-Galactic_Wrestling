///@desc Jump
moving = true;
attacking = true;

alarm[2] = -1;
hit_counter = 0;
blocking = false;

look_at(obj_player);
enemy_jump(-35,sou_jump);