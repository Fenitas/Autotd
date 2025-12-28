// Enemy Unit - Step Event

// Update attack timer
if (attack_timer > 0) {
    attack_timer--;
}

// State machine
switch (state) {
    case "idle":
        // Acquire target
        target = find_nearest_enemy(team);
        if (is_target_valid(target)) {
            state = "moving";
            last_distance = get_distance_to_target(target);
            stuck_timer = 0;
        }
        break;

    case "moving":
        // Try to acquire target if we don't have one
        if (!is_target_valid(target)) {
            target = find_nearest_enemy(team);
        }

        // If we have a target, move toward it
        if (is_target_valid(target)) {
            // Check if in range
            if (is_in_range(target, attack_range)) {
                state = "attacking";
                break;
            }

            // Move toward target
            move_toward_target(target, move_speed);

            // Anti-stuck logic
            var _current_distance = get_distance_to_target(target);
            if (last_distance >= 0) {
                if (_current_distance >= last_distance - 0.5) {
                    // Not making progress
                    stuck_timer++;
                    if (stuck_timer >= stuck_threshold) {
                        // Stuck! Retarget
                        target = noone;
                        stuck_timer = 0;
                    }
                } else {
                    // Making progress
                    stuck_timer = 0;
                }
            }
            last_distance = _current_distance;
        } else {
            // No target - move toward rally point (center)
            var _dir = point_direction(x, y, rally_point_x, rally_point_y);
            var _dx = lengthdir_x(move_speed, _dir);
            var _dy = lengthdir_y(move_speed, _dir);
            x += _dx;
            y += _dy;
        }
        break;

    case "attacking":
        // Check if target is still valid
        if (!is_target_valid(target)) {
            state = "idle";
            break;
        }

        // Check if still in range
        if (!is_in_range(target, attack_range)) {
            state = "moving";
            last_distance = get_distance_to_target(target);
            stuck_timer = 0;
            break;
        }

        // Attack on cooldown
        if (attack_timer <= 0) {
            // Deal damage
            target.hp -= attack_damage;
            attack_timer = attack_cooldown;

            // Check if target died
            if (target.hp <= 0) {
                state = "idle";
                target = noone;
            }
        }
        break;
}

// Check for death
if (hp <= 0) {
    // Reward gold to player
    if (instance_exists(obj_game)) {
        obj_game.gold += 1;
    }
    instance_destroy();
}
