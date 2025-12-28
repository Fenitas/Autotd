/// obj_game Step Event

// Phase transitions
if (phase == "WAVE") {
    // Check if wave is complete (spawner done AND no enemies alive)
    var enemy_count = instance_number(obj_enemy);

    if (spawning_complete && enemy_count == 0) {
        // Wave complete - transition back to BUILD
        phase = "BUILD";
        wave += 1;
        gold += 5; // Wave completion bonus
        spawning_complete = false;
        spawner_finished = false;

        // Clear grid for next build phase
        ds_grid_clear(grid, false);
    }
}

// Update message timer
if (show_low_gold_message) {
    message_timer -= 1;
    if (message_timer <= 0) {
        show_low_gold_message = false;
    }
}
