draw_self()

var gaugeOffset = x + sprite_width + sprite_width / 2; 
draw_sprite(spr_binChickenEnergyBorder, 0, gaugeOffset, y);
draw_sprite_ext(spr_binChickenEnergyBar, 0, gaugeOffset + 1, y + 1, energyPercentage, 1, 0, c_white, 1);
