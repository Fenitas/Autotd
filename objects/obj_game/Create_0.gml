/// obj_game Create Event

// Game states
phase = "BUILD"; // BUILD or WAVE
wave = 1;
gold = 50;

// Grid configuration
grid_cols = 10;
grid_rows = 4;
cell_size = 64;
grid_start_x = 32;
grid_start_y = 384; // Bottom area (starts at 60% down)

// Game zones
room_width = room_width;
room_height = room_height;
build_zone_y = room_height * 0.6; // Bottom 40% starts at 60% down

// Spawner tracking
spawner_finished = false;
spawning_complete = false;

// UI state
show_low_gold_message = false;
message_timer = 0;

// Button state
button_width = 100;
button_height = 40;
button_x = room_width - 150;
button_y = 20;

// Targeting points
rally_point_x = room_width / 2;
rally_point_y = room_height / 2;

// Initialize grid (track occupied cells)
grid = ds_grid_create(grid_cols, grid_rows);
ds_grid_clear(grid, false);
