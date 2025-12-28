/// obj_game Draw GUI Event

// Get counts
var allied_count = instance_number(obj_unit);
var enemy_count = instance_number(obj_enemy);

// Draw UI text
draw_set_color(c_white);
draw_set_font(-1);

// Phase and Wave info
draw_text(20, 20, "Phase: " + phase);
draw_text(20, 40, "Wave: " + string(wave));
draw_text(20, 60, "Gold: " + string(gold));
draw_text(20, 80, "Enemies: " + string(enemy_count));
draw_text(20, 100, "Allies: " + string(allied_count));

// Draw Start Wave button during BUILD phase
if (phase == "BUILD") {
    var button_hover = (mouse_x >= button_x && mouse_x <= button_x + button_width &&
                        mouse_y >= button_y && mouse_y <= button_y + button_height);

    if (button_hover) {
        draw_set_color(c_yellow);
    } else {
        draw_set_color(c_white);
    }

    draw_rectangle(button_x, button_y, button_x + button_width, button_y + button_height, false);
    draw_set_color(c_black);
    draw_text(button_x + 5, button_y + 10, "Start Wave");
    draw_set_color(c_white);
}

// Show low gold message
if (show_low_gold_message) {
    draw_set_color(c_red);
    draw_text(200, 60, "Not enough gold!");
    draw_set_color(c_white);
}

// Draw grid outline (BUILD phase)
if (phase == "BUILD") {
    draw_set_color(c_gray);
    for (var i = 0; i <= grid_cols; i++) {
        draw_line(grid_start_x + i * cell_size, grid_start_y,
                  grid_start_x + i * cell_size, grid_start_y + grid_rows * cell_size);
    }
    for (var j = 0; j <= grid_rows; j++) {
        draw_line(grid_start_x, grid_start_y + j * cell_size,
                  grid_start_x + grid_cols * cell_size, grid_start_y + j * cell_size);
    }
    draw_set_color(c_white);
}

// Draw rally point marker
draw_set_color(c_lime);
draw_circle(rally_point_x, rally_point_y, 5, false);
draw_set_color(c_white);
