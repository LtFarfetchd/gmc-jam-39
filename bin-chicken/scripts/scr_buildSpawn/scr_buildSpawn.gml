// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_buildSpawn(){
	if (nextBuildingX +  buidingWidth> room_width  - 64)
	{
		createNextBuilding = false;
	}
	else
	{
		randomize();
		var buildingX = nextBuildingX + irandom_range(0, buidingWidth);
		if (buildingX + buidingWidth < room_width  - 64)
		{
			nextBuildingX = buildingX;			
		}
		else
		{
			createNextBuilding = false;
		}
		
		var isTree = irandom(1);
		if (isTree == 0)
		{
			instance_create_layer(nextBuildingX, room_height - sprite_get_height(spr_building) - 64, layer_get_id("lay_environment"), obj_building);
			nextBuildingX += buidingWidth;
		}
		else
		{
			//instance_create_layer(nextBuildingX, room_height - sprite_get_height(spr_tree), layer, obj_building).spriteIndex = spr_tree;
			//nextBuildingX += buidingWidth;
		}
	}	
}