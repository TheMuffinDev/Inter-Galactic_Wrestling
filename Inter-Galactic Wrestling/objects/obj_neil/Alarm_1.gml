/// @description Choose Attack
if(abs(x - obj_player.x) > 500)
{
	initiate_timeline(choose(tim_neil_gotto,tim_neil_gotto,tim_neil_jump),0,1);
}
else
{
	initiate_timeline(choose(tim_neil_punch,tim_neil_punch_once),0,1);
}