/// obj_game Mouse Left Click Event

if (phase == "BUILD") {
    // Check if click is on the "Start Wave" button
    if (mouse_x >= button_x && mouse_x <= button_x + button_width &&
        mouse_y >= button_y && mouse_y <= button_y + button_height) {
        // Start the wave
        phase = "WAVE";
        spawning_complete = false;

        // Create spawner
        instance_create_layer(room_width / 2, -32, "Instances", obj_spawner);
        exit;
    }

    // Check if click is in the grid
    var click_x = mouse_x;
    var click_y = mouse_y;

    if (click_x >= grid_start_x && click_x < grid_start_x + grid_cols * cell_size &&
        click_y >= grid_start_y && click_y < grid_start_y + grid_rows * cell_size) {

        var grid_col = (click_x - grid_start_x) div cell_size;
        var grid_row = (click_y - grid_start_y) div cell_size;

        // Check if cell is empty and we have enough gold
        if (!grid[grid_col, grid_row] && gold >= 10) {
            // Place unit
            var unit_x = grid_start_x + grid_col * cell_size + cell_size / 2;
            var unit_y = grid_start_y + grid_row * cell_size + cell_size / 2;

            instance_create_layer(unit_x, unit_y, "Instances", obj_unit);

            // Update grid
            grid[grid_col, grid_row] = true;

            // Deduct gold
            gold -= 10;
        } else if (grid[grid_col, grid_row]) {
            // Cell already occupied
            show_low_gold_message = true;
            message_timer = 60;
        } else if (gold < 10) {
            // Not enough gold
            show_low_gold_message = true;
            message_timer = 60;
        }
    }
}
