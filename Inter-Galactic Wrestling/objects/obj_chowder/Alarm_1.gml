/// @description Choose Attack

if(abs(x - obj_player.x) > 700)
{
	initiate_timeline(choose(tim_chowder_jump_attack_long,tim_chowder_dash),0,1);
}
else
{
	initiate_timeline(choose(tim_chowder_hammer,tim_chowder_jump_attack,tim_chowder_saw,tim_chowder_saw),0,1);
}