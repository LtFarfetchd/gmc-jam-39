global.SPAWN_OFFSET_FROM_GROUND = 0;
global.SPAWN_OFFSET_FROM_SIDES = 64;

titleScreen = true;
dead = false;

randomize();

homeBaseWidth = sprite_get_width(spr_homeBase)  + global.SPAWN_OFFSET_FROM_SIDES;

createNextBuilding = true;
nextBuildingX = homeBaseWidth;
buidingWidth = sprite_get_width(spr_building);

nextBinX = homeBaseWidth;
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
