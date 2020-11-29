// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_binSpawn(){
	if (nextBinX +  binWidth> room_width)
	{
		createNextBin = false;
	}
	else
	{
		randomize();
		var binX = nextBinX + irandom_range(buidingWidth /2, buidingWidth * 2);
		if (binX + binWidth < room_width)
		{
			nextBinX = binX;			
		}
		else
		{
			createNextBin = false;
		}
		
		instance_create_layer(nextBinX, room_height - sprite_get_height(spr_binVariationTwo), layer, obj_testBin);
		nextBinX += binWidth;
	}	
}