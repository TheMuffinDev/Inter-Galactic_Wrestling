//Spawning Stars
var _half_width = obj_camera.cam_width / 2 * 1.5;
var _half_height = obj_camera.cam_height / 2 * 1.5;

if(spawn_stars)
{
	for(var re = 1; re <= 6; re++)
	{
		with(instance_create_layer(x, y, "Back", obj_star))
		{
			x_add += irandom_range(_half_width,_half_width*-1);
			y_add += irandom_range(_half_height,_half_height*-1);
		}
	}
}