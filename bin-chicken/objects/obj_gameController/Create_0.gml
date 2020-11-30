/// @description Insert description here
// You can write your code in this editor\
titleScreen = true;
dead = false;

randomize();

homeBaseWidth = sprite_get_width(spr_homeBase)  + 64;

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
