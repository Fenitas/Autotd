// Game Manager - Create Event

// Game state
phase = "BUILD"; // "BUILD" or "WAVE"
wave = 1;
gold = 50;

// Grid settings (bottom 40% of room)
grid_width = 10;
grid_height = 4;
cell_size = 64;

// Calculate grid position (centered horizontally, at bottom)
grid_start_x = (room_width - grid_width * cell_size) / 2;
grid_start_y = room_height - grid_height * cell_size - 20;

// UI settings
show_low_gold_message = false;
low_gold_timer = 0;

// Wave completion check
wave_complete_check_delay = 0;
