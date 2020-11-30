var wall = instance_create_layer(bbox_left, bbox_top, layer, obj_wall);
wall.image_xscale = BORDER_WIDTH;
wall.image_yscale = bbox_bottom - bbox_top;

wall = instance_create_layer(bbox_right - BORDER_WIDTH, bbox_top, layer, obj_wall);
wall.image_xscale = BORDER_WIDTH;
wall.image_yscale = bbox_bottom - bbox_top;

wall = instance_create_layer(
	bbox_left + BORDER_WIDTH
	, bbox_bottom - LINING_HEIGHT
	, layer, obj_wall
);
wall.image_xscale = bbox_right - bbox_left - 2 * BORDER_WIDTH;
wall.image_yscale = LINING_HEIGHT;