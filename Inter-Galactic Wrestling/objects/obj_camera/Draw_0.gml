//Setting Up
var _half_width = cam_width/2;
var _half_height = cam_height/2;



//In Game UI
if(room = room_arena)
	draw_in_game_ui();

//Results UI
if(room = room_results)
	draw_results_ui();

//Mutations UI
if(room = room_mutations)
	draw_mutations_ui();

//Fight Board UI
if(room = room_hub)
	draw_fight_board_ui();





//Screen Fade
if(screen_fade = "fade")
{
	screen_darkness += 0.025;
	draw_set_color(c_black);
	draw_set_alpha(screen_darkness);
	draw_rectangle(x-2000,y-2000,x+2000,y+2000,0);
	draw_set_alpha(1);
}

if(screen_fade = "fade in")
{
	screen_darkness -= 0.025;
	draw_set_color(c_black);
	draw_set_alpha(screen_darkness);
	draw_rectangle(x-2000,y-2000,x+2000,y+2000,0);
	draw_set_alpha(1);
	
	if(screen_darkness <= 0)
		screen_fade = "none";
}




//Moving the Camera
if(follow != noone)
{
	x_to = follow.x;
	if(follow = obj_player) && (room == room_arena)
		y_to = 32;
	
	if(follow = obj_player) && (room == room_hub)
		y_to = -50;
}

x += (x_to - x) / cam_speed;
y += (y_to - y) / cam_speed;


//Zoom
zoom += (zoom_to - zoom) / zoom_speed;