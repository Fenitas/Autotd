// UI drawing helper functions

/// @function draw_button(_x, _y, _w, _h, _text)
/// @description Draw a button and return true if clicked
function draw_button(_x, _y, _w, _h, _text) {
    var _mx = mouse_x;
    var _my = mouse_y;
    var _hover = point_in_rectangle(_mx, _my, _x, _y, _x + _w, _y + _h);
    var _clicked = _hover && mouse_check_button_pressed(mb_left);

    // Draw button
    draw_set_color(_hover ? c_yellow : c_white);
    draw_rectangle(_x, _y, _x + _w, _y + _h, false);
    draw_set_color(c_black);
    draw_rectangle(_x, _y, _x + _w, _y + _h, true);

    // Draw text
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text(_x + _w / 2, _y + _h / 2, _text);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);

    return _clicked;
}

/// @function draw_grid_overlay(_grid_start_x, _grid_start_y, _grid_width, _grid_height, _cell_size)
/// @description Draw grid overlay for placement
function draw_grid_overlay(_grid_start_x, _grid_start_y, _grid_width, _grid_height, _cell_size) {
    draw_set_alpha(0.3);
    draw_set_color(c_white);

    // Draw grid lines
    for (var _i = 0; _i <= _grid_width; _i++) {
        var _x = _grid_start_x + _i * _cell_size;
        draw_line(_x, _grid_start_y, _x, _grid_start_y + _grid_height * _cell_size);
    }

    for (var _j = 0; _j <= _grid_height; _j++) {
        var _y = _grid_start_y + _j * _cell_size;
        draw_line(_grid_start_x, _y, _grid_start_x + _grid_width * _cell_size, _y);
    }

    draw_set_alpha(1);
}

/// @function draw_hovered_cell(_gx, _gy, _grid_start_x, _grid_start_y, _cell_size, _valid)
/// @description Highlight the hovered grid cell
function draw_hovered_cell(_gx, _gy, _grid_start_x, _grid_start_y, _cell_size, _valid) {
    draw_set_alpha(0.5);
    draw_set_color(_valid ? c_lime : c_red);

    var _x = _grid_start_x + _gx * _cell_size;
    var _y = _grid_start_y + _gy * _cell_size;

    draw_rectangle(_x, _y, _x + _cell_size, _y + _cell_size, false);
    draw_set_alpha(1);
}
