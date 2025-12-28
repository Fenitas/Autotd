/// obj_unit Step Event

// State machine
switch (state) {
    case "idle":
        state = "acquire_target";
        target = noone;
        break;

    case "acquire_target":
        // Find nearest enemy
        var nearest = noone;
        var nearest_dist = 9999;

        with (obj_enemy) {
            if (hp > 0) {
                var dist = distance_to_object(other);
                if (dist < nearest_dist) {
                    nearest_dist = dist;
                    nearest = id;
                }
            }
        }

        if (nearest != noone) {
            target = nearest;
            state = "move_to_range";
            last_target_distance = distance_to_object(target);
            stuck_timer = 0;
        }
        break;

    case "move_to_range":
        if (target == noone || target.hp <= 0) {
            state = "acquire_target";
            break;
        }

        var dist = distance_to_object(target);

        // Anti-stuck logic
        if (dist >= last_target_distance - 5) {
            stuck_timer += 1;
        } else {
            stuck_timer = 0;
        }

        if (stuck_timer > stuck_threshold) {
            // Retarget if stuck
            state = "acquire_target";
            stuck_timer = 0;
            break;
        }

        last_target_distance = dist;

        if (dist <= attack_range) {
            state = "attack";
            attack_cooldown = 0;
        } else {
            // Move toward target
            var dx = target.x - x;
            var dy = target.y - y;
            var dir = atan2(dy, dx);

            var move_distance = speed / room_speed;
            x += cos(dir) * move_distance;
            y += sin(dir) * move_distance;
        }
        break;

    case "attack":
        if (target == noone || target.hp <= 0) {
            state = "acquire_target";
            break;
        }

        var dist = distance_to_object(target);
        if (dist > attack_range + 10) {
            state = "move_to_range";
            break;
        }

        attack_cooldown -= 1;
        if (attack_cooldown <= 0) {
            target.hp -= attack_damage;
            attack_cooldown = attack_cooldown_frames;

            if (target.hp <= 0) {
                state = "acquire_target";
            }
        }
        break;
}

// Destroy if dead
if (hp <= 0) {
    instance_destroy();
}
