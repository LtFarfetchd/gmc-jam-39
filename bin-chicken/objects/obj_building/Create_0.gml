/// @description Insert description here
// You can write your code in this editor
randomize();
image_index = irandom_range(0, sprite_get_number(sprite_index) -1);
image_speed = 0;

instance_create_layer(x + sprite_width /2, y + sprite_height /2, layer_get_id("lay_environment"), obj_bookSpawner);