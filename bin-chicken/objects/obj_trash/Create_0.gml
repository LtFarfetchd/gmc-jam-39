randomize();

image_speed = 0;
image_index = choose(0, 1, 2);

ARC_TIME = choose (0.75, 1, 1.25); // in seconds
A = choose(-0.04, -0.05,  -0.06);
B = 10 * choose(-1, 1);
X_START = x;
Y_START = y;

timeSinceSpawn = 0; // in steps
