// Targeting functions for combat units

/// @function find_nearest_enemy(_team)
/// @description Find the nearest enemy unit (opposite team)
/// @param {string} _team - "ally" or "enemy"
function find_nearest_enemy(_team) {
    var _target_obj = (_team == "ally") ? obj_enemy : obj_unit;
    var _nearest = noone;
    var _min_dist = -1;

    with (_target_obj) {
        var _dist = point_distance(x, y, other.x, other.y);
        if (_min_dist < 0 || _dist < _min_dist) {
            _min_dist = _dist;
            _nearest = id;
        }
    }

    return _nearest;
}

/// @function is_target_valid(_target)
/// @description Check if target still exists and is valid
function is_target_valid(_target) {
    return _target != noone && instance_exists(_target);
}

/// @function get_distance_to_target(_target)
/// @description Get distance to target
function get_distance_to_target(_target) {
    if (!is_target_valid(_target)) return -1;
    return point_distance(x, y, _target.x, _target.y);
}
