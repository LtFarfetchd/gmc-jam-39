var xOffset = sprite_get_xoffset(sprite_index);
var yOffset = sprite_get_yoffset(sprite_index);

draw_sprite_ext(spr_binChickenEnergyBar, 0, xOffset, yOffset, energyPercentage * INTERNAL_WIDTH / 100, 2, 0, c_white, 1);
draw_sprite_ext(sprite_index, 0, xOffset, yOffset, 1, 1, 0, c_white, 1);
