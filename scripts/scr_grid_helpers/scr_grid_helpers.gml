// Grid helper functions for unit placement

/// @function grid_to_world(_gx, _gy, _grid_start_x, _grid_start_y, _cell_size)
/// @description Convert grid coordinates to world coordinates (centered in cell)
function grid_to_world(_gx, _gy, _grid_start_x, _grid_start_y, _cell_size) {
    return {
        x: _grid_start_x + _gx * _cell_size + _cell_size / 2,
        y: _grid_start_y + _gy * _cell_size + _cell_size / 2
    };
}

/// @function world_to_grid(_wx, _wy, _grid_start_x, _grid_start_y, _cell_size)
/// @description Convert world coordinates to grid coordinates
function world_to_grid(_wx, _wy, _grid_start_x, _grid_start_y, _cell_size) {
    return {
        gx: floor((_wx - _grid_start_x) / _cell_size),
        gy: floor((_wy - _grid_start_y) / _cell_size)
    };
}

/// @function is_grid_cell_valid(_gx, _gy, _grid_width, _grid_height)
/// @description Check if grid coordinates are within bounds
function is_grid_cell_valid(_gx, _gy, _grid_width, _grid_height) {
    return _gx >= 0 && _gx < _grid_width && _gy >= 0 && _gy < _grid_height;
}

/// @function is_grid_cell_occupied(_gx, _gy, _grid_start_x, _grid_start_y, _cell_size)
/// @description Check if a grid cell has a unit in it
function is_grid_cell_occupied(_gx, _gy, _grid_start_x, _grid_start_y, _cell_size) {
    var _pos = grid_to_world(_gx, _gy, _grid_start_x, _grid_start_y, _cell_size);
    var _unit = instance_position(_pos.x, _pos.y, obj_unit);
    return _unit != noone;
}
