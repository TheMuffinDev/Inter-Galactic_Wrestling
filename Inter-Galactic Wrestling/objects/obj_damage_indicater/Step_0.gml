//Slowing Down
if(speed > 0)
	speed -= 2;

if(speed < 0)
	speed = 0;


//Shrinking
if(ded == 1)
{
	scale -= 0.1;
	if(scale <= 0)
		instance_destroy();
}