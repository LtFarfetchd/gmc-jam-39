if (energy < 0) {
	energy = global.STARTING_ENERGY;	
}

if (hp < 0) {
	hp = global.STARTING_HP;	
}

energyPercentage = round(energy / global.STARTING_ENERGY * 100);
hpPercentage = round(hp / global.STARTING_HP * 100);
