/// @description Insert description here
// You can write your code in this editor
if (titleScreen == true)
{
	draw_sprite(spr_titleScreen, 0, 0, 0);
}

if (win == true)
{
	draw_sprite(spr_win, 0, 0, 0);
}
else if (dead == true)
{
	draw_sprite(spr_deathScreen, 0, 0, 0);
}

