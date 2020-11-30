randomize();

image_speed = 0;
image_index = choose(0, 1, 2);

ARC_TIME = choose (1.5, 1.75, 2); // in seconds
A = choose(-0.02, -0.03,  -0.04);
B = 20 * choose(-1, 1);
X_START = x;
Y_START = y;
ROTATION = choose(5, 7.5, 10) * sign(B); // degrees per step
MOTE_SPAWN_STEPS = 4; // number of steps between mote spawns

timeSinceSpawn = 0; // in steps
