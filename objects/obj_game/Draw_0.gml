// Game Manager - Draw Event (World space)

// Draw grid overlay and highlight during BUILD phase
if (phase == "BUILD") {
    // Draw grid overlay
    draw_grid_overlay(grid_start_x, grid_start_y, grid_width, grid_height, cell_size);

    // Highlight hovered cell
    var _grid_coords = world_to_grid(mouse_x, mouse_y, grid_start_x, grid_start_y, cell_size);
    var _gx = _grid_coords.gx;
    var _gy = _grid_coords.gy;

    if (is_grid_cell_valid(_gx, _gy, grid_width, grid_height)) {
        var _occupied = is_grid_cell_occupied(_gx, _gy, grid_start_x, grid_start_y, cell_size);
        var _valid = !_occupied && gold >= 10;
        draw_hovered_cell(_gx, _gy, grid_start_x, grid_start_y, cell_size, _valid);
    }
}
