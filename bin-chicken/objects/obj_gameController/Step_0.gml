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

if (titleScreen == false && (dead == true || win == true) && keyboard_check_pressed(vk_space))
{
	game_restart();	
}

if (ds_list_find_value(binsList, currenBin).energy <= 0 && win == false)
{
	if (currenBin >= ds_list_size(binsList) -1)
	{
		win = true;
	}
	else
	{
		currenBin++;
	}
}