// Game Manager - Step Event

// Update low gold message timer
if (show_low_gold_message) {
    low_gold_timer--;
    if (low_gold_timer <= 0) {
        show_low_gold_message = false;
    }
}

// BUILD PHASE - Unit placement
if (phase == "BUILD") {
    // Check for grid click to place unit
    if (mouse_check_button_pressed(mb_left)) {
        var _grid_coords = world_to_grid(mouse_x, mouse_y, grid_start_x, grid_start_y, cell_size);
        var _gx = _grid_coords.gx;
        var _gy = _grid_coords.gy;

        // Check if click is within grid
        if (is_grid_cell_valid(_gx, _gy, grid_width, grid_height)) {
            // Check if cell is empty and player has gold
            if (!is_grid_cell_occupied(_gx, _gy, grid_start_x, grid_start_y, cell_size)) {
                if (gold >= 10) {
                    // Place unit
                    var _pos = grid_to_world(_gx, _gy, grid_start_x, grid_start_y, cell_size);
                    instance_create_depth(_pos.x, _pos.y, 0, obj_unit);
                    gold -= 10;
                } else {
                    // Show low gold message
                    show_low_gold_message = true;
                    low_gold_timer = 60; // Show for 1 second
                }
            }
        }
    }
}

// WAVE PHASE - Check for wave completion
if (phase == "WAVE") {
    wave_complete_check_delay++;

    // Check every 10 frames (reduce overhead)
    if (wave_complete_check_delay >= 10) {
        wave_complete_check_delay = 0;

        var _enemies_alive = instance_number(obj_enemy);
        var _spawner_exists = instance_exists(obj_spawner);

        // If no enemies and spawner is done, complete wave
        if (_enemies_alive == 0 && !_spawner_exists) {
            // Wave complete!
            phase = "BUILD";
            wave++;
            gold += 5; // Wave completion bonus
        }
    }
}
