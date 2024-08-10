///@desc Wind Up Punch
sprite_index = spr_chowder_saw;
image_index = 0;

squish(1.35,0.75);
look_at(obj_player);

attacking = true;

alarm[2] = -1;
hit_counter = 0;
blocking = false;