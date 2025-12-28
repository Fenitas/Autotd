// Enemy Unit - Create Event

// Stats
hp = 80;
max_hp = 80;
move_speed = 1.2;
attack_range = 60;
attack_damage = 8;
attack_cooldown = 35; // frames
attack_timer = 0;

// Combat state
team = "enemy";
target = noone;
state = "moving"; // Start moving toward center
rally_point_x = room_width / 2;
rally_point_y = room_height / 2;

// Anti-stuck logic
last_distance = -1;
stuck_timer = 0;
stuck_threshold = 60; // 1 second at 60fps
