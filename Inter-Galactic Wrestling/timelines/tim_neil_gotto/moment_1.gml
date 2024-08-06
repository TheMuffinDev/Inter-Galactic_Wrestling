///@desc Stop Walking
enemy_stop_walking();

//desc Wind Up Punch
sprite_index = spr_neil_punch;
image_index = 0;

squish(1.35,0.75);
look_at(obj_player);

attacking = true;
running_to_player = false;

initiate_timeline(choose(tim_neil_punch,tim_neil_punch_once,tim_neil_jump),0,1);