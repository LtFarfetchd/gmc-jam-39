/// @description Insert description here
// You can write your code in this editor
if (titleScreen == true)
{
	draw_sprite(spr_titleScreen, 0, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]));
}

if (dead == true)
{
	draw_sprite(spr_deathScreen, 0, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]));
}