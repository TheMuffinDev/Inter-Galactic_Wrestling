//Fading
if(fade_type == "fade")
{
	image_alpha -= fade_speed;
	if(image_alpha <= 0)
		instance_destroy();
}