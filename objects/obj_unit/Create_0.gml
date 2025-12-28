// Allied Unit - Create Event

// Stats
hp = 100;
max_hp = 100;
move_speed = 1.5;
attack_range = 60;
attack_damage = 10;
attack_cooldown = 30; // frames
attack_timer = 0;

// Combat state
team = "ally";
target = noone;
state = "idle"; // "idle", "moving", "attacking"

// Anti-stuck logic
last_distance = -1;
stuck_timer = 0;
stuck_threshold = 60; // 1 second at 60fps
