// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function look_at(_object){
	
	facing = sign(_object.x - x);
	if(facing == 0)
		facing = 1;
		
}