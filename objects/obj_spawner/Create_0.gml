/// obj_spawner Create Event

// Get game object reference
game = obj_game;

// Calculate how many enemies to spawn (6 base + 2 per wave)
enemies_to_spawn = 6 + (game.wave - 1) * 2;
enemies_spawned = 0;

// Spawn timing
spawn_timer = 0;
spawn_interval = 30; // Frames between spawns

// Spawn band
spawn_x_min = 100;
spawn_x_max = game.room_width - 100;
spawn_y = -32;
