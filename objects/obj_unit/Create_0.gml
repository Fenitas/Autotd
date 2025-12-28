/// obj_unit Create Event

// Unit stats
hp = 30;
max_hp = 30;
attack_damage = 5;
attack_range = 40;
attack_speed = 1.0 / 60; // Attacks once per second
attack_cooldown = 0;

// Movement
speed = 100; // pixels per frame
move_x = x;
move_y = y;

// AI state
state = "idle"; // idle, acquire_target, move_to_range, attack
target = noone;
last_target_distance = 999;
stuck_timer = 0;
stuck_threshold = 1.0 * room_speed; // 1 second

// Team
team = "ally";
