// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function explode(_sprite,_index,_amount,_size,_direction,_speed,_speed_change,_rotate_speed,_lifetime,_color){


//Create the Explosion
for(var re = 1; re <= _amount; re++)
{
	with(instance_create_depth(x,y,depth-1,obj_particle))
	{
		sprite_index = _sprite;
		image_index = _index;
		direction = random_range(_direction[0], _direction[1]);
		speed = random_range(_speed[0], _speed[1]);
		speed_change = random_range(_speed_change[0], _speed_change[1]);
		rotate_speed = random_range(_rotate_speed[0], _rotate_speed[1]) * choose(1,-1);
		
		var _scale = random_range(_size[0], _size[1]);
		image_xscale = _scale;
		image_yscale = _scale;
		scale = _scale;
		
		alarm[0] = random_range(_lifetime[0], _lifetime[1]);
		image_blend = _color;
	}
}


}