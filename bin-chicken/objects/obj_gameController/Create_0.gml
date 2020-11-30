global.SPAWN_OFFSET_FROM_GROUND = 0;
global.SPAWN_OFFSET_FROM_SIDES = 64;

titleScreen = true;
dead = false;

randomize();

var homeBase = instance_find(obj_homeBase, 0);
var homeBaseRightSide = homeBase.x + sprite_get_width(spr_homeBase) / 2;

createNextBuilding = true;
nextBuildingX = homeBaseRightSide;
buidingWidth = sprite_get_width(spr_building);

nextBinX = homeBaseRightSide;
createNextBin = true;
binWidth = sprite_get_width(spr_binVariationTwo);

while (createNextBuilding == true)
{
		scr_buildSpawn();
}

while (createNextBin == true)
{
		scr_binSpawn();
}
