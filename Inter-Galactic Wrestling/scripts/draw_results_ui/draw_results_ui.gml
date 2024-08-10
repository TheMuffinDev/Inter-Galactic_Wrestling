// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_results_ui(){

//Setting Up
var _half_width = cam_width/2;
var _half_height = cam_height/2;



//Black Box
draw_set_alpha(1);
draw_sprite(spr_results_black,0,-250+display_add1,0-1440+black_add);
draw_sprite(spr_results_black,0,-250+display_add1,0+black_add);
draw_set_alpha(1);

//Fight Won!
set_up_text(font_fancy,c_white,fa_center,fa_center);
outline_text(x,y-_half_height+230+display_add0,"Fight Won!",2,2,sine_wave(current_time / 1000, 3, 3.5, 0),12,make_color_hsv(50,100,255),c_black);



set_up_text(font_base,c_white,fa_left,fa_center);

//Time
outline_text(x-_half_width+50+display_add2,y-200,"Time: ",1.2,1.2,-2,8,c_white,c_black);

//Getting Time
var _minutes = string(global.timing.minutes);
if(string_length(_minutes) == 1)
	_minutes = "0" + _minutes;

var _seconds = string(global.timing.seconds);
if(string_length(_seconds) == 1)
	_seconds = "0" + _seconds;
	
var _miliseconds = string(round(global.timing.miliseconds));
if(string_length(_miliseconds) == 1)
	_miliseconds = "0" + _miliseconds;

//Writing Time
outline_text(x-_half_width+500+display_add2,y-180,_minutes + ":" + _seconds + ":" + _miliseconds,1.2,1.2,-2,8,make_color_hsv(180,100,255),c_black);



//Hits Taken
outline_text(x-_half_width+50+display_add3,y-200+250,"Hits Taken: ",1.2,1.2,-2,8,c_white,c_black);
outline_text(x-_half_width+915+display_add3,y-185+270,string(global.player_hit_counter),1.2,1.2,-2,8,make_color_hsv(180,100,255),c_black);



//Audience Rating
outline_text(x-_half_width+50+display_add4,y-200+500,"Audience: ",1.2,1.2,-2,8,c_white,c_black);

if(audience_rating == 6)
	outline_text(177+display_add4,692,string(audience_rating) + "/5 STARS!!!",1.2,1.2,-2,8,make_color_hsv(180,100,255),c_black);
else if(audience_rating == 5)
	outline_text(177+display_add4,692,string(audience_rating) + "/5 stars!!!",1.2,1.2,-2,8,make_color_hsv(180,100,255),c_black);
else if(audience_rating == 4)
	outline_text(177+display_add4,692,string(audience_rating) + "/5 stars!",1.2,1.2,-2,8,make_color_hsv(180,100,255),c_black);
else if(audience_rating == 3)
	outline_text(177+display_add4,692,string(audience_rating) + "/5 stars.",1.2,1.2,-2,8,make_color_hsv(180,100,255),c_black);
else if(audience_rating == 2)
	outline_text(177+display_add4,692,string(audience_rating) + "/5 stars...",1.2,1.2,-2,8,make_color_hsv(180,100,255),c_black);
else if(audience_rating == 1)
	outline_text(177+display_add4,692,string(audience_rating) + "/5 stars... :(",1.2,1.2,-2,8,make_color_hsv(180,100,255),c_black);

//Z - Continue
outline_text(x-_half_width+50+display_add5+sine_wave(current_time / 1000, 0.75, 10, 0),y+_half_height-75,"z - Continue",0.7,0.7,0,5,make_color_hsv(50,100,255),c_black);



//Display Adds
display_add0 += (display_add0_to - display_add0) / 5;
display_add1 += (display_add1_to - display_add1) / 5;
display_add2 += (display_add2_to - display_add2) / 5;
display_add3 += (display_add3_to - display_add3) / 5;
display_add4 += (display_add4_to - display_add4) / 5;
display_add5 += (display_add5_to - display_add5) / 5;

//Black Add
if(black_add_increase == 0)
{
	black_add += 2.5;
	if(black_add > 1440)
		black_add = 0;
}




}