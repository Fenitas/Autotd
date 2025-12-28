// Movement functions for combat units

/// @function move_toward_target(_target, _move_speed)
/// @description Move toward a target position
function move_toward_target(_target, _move_speed) {
    if (!is_target_valid(_target)) return false;

    var _dir = point_direction(x, y, _target.x, _target.y);
    var _dx = lengthdir_x(_move_speed, _dir);
    var _dy = lengthdir_y(_move_speed, _dir);

    x += _dx;
    y += _dy;

    return true;
}

/// @function is_in_range(_target, _range)
/// @description Check if target is within range
function is_in_range(_target, _range) {
    if (!is_target_valid(_target)) return false;
    return point_distance(x, y, _target.x, _target.y) <= _range;
}
