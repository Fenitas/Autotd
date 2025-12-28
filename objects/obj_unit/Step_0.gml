// Allied Unit - Step Event

// Only act during WAVE phase
if (!instance_exists(obj_game) || obj_game.phase != "WAVE") {
    exit;
}

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
        // Check if target is still valid
        if (!is_target_valid(target)) {
            state = "idle";
            break;
        }

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
                    state = "idle";
                    stuck_timer = 0;
                }
            } else {
                // Making progress
                stuck_timer = 0;
            }
        }
        last_distance = _current_distance;
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
                // Don't reward gold for killing allies (shouldn't happen but just in case)
                state = "idle";
                target = noone;
            }
        }
        break;
}

// Check for death
if (hp <= 0) {
    instance_destroy();
}
