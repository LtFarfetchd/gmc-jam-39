/// @description Insert description here
// You can write your code in this editor
randomize();

createNextBuilding = true;
nextBuildingX = 0;
buidingWidth = sprite_get_width(spr_building);

nextBinX = 0;
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
