// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_binSpawn(){
	if (nextBinX +  binWidth> room_width - global.SPAWN_OFFSET_FROM_SIDES)
	{
		createNextBin = false;
	}
	else
	{
		randomize();
		var binX = nextBinX + irandom_range(buidingWidth /2, buidingWidth * 2);
		if (binX + binWidth < room_width  - global.SPAWN_OFFSET_FROM_SIDES)
		{
			nextBinX = binX;			
		}
		else
		{
			createNextBin = false;
		}
		
		// TODO: spawn retaining walls
		var newBin = instance_create_layer(nextBinX, room_height - sprite_get_height(spr_binVariationTwo) - global.SPAWN_OFFSET_FROM_GROUND, layer_get_id("lay_bins"), choose(obj_binVariationOne, obj_binVariationTwo));
		ds_list_add(binsList, newBin);
		nextBinX += binWidth;
	}	
}