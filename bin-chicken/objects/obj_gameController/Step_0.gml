/// @description Insert description here
// You can write your code in this editor
if (titleScreen == true && keyboard_check_pressed(vk_space))
{
	titleScreen = false;
}

if (titleScreen == false && dead == false && obj_binChicken.state == states.dead)
{
	dead = true;
}

if (titleScreen == false && dead == true && keyboard_check_pressed(vk_space))
{
	room_restart();	
}