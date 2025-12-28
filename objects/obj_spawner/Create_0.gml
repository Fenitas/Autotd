// Enemy Spawner - Create Event

// Get current wave from game manager
if (instance_exists(obj_game)) {
    current_wave = obj_game.wave;
} else {
    current_wave = 1;
}

// Calculate enemy count: wave 1 = 6 enemies, +2 per wave
enemies_to_spawn = 6 + (current_wave - 1) * 2;
enemies_spawned = 0;

// Spawn settings
spawn_timer = 0;
spawn_delay = 30; // Spawn every 0.5 seconds (30 frames at 60fps)

// Spawn area (top edge with some randomization)
spawn_min_x = 100;
spawn_max_x = room_width - 100;
spawn_y = 50;
