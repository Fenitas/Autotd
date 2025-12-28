/// obj_unit Draw Event

// Draw unit as a circle (ally = blue)
draw_set_color(c_blue);
draw_circle(x, y, 8, false);

// Draw health bar above unit
draw_set_color(c_green);
var health_width = 16;
var health_height = 4;
draw_rectangle(x - health_width/2, y - 16, x - health_width/2 + (hp / max_hp) * health_width, y - 12, false);

draw_set_color(c_red);
draw_rectangle(x - health_width/2, y - 16, x + health_width/2, y - 12, false);

// Draw attack range when selected
if (target != noone && target.hp > 0) {
    draw_set_color(c_lime);
    draw_circle(x, y, attack_range, true);
}

draw_set_color(c_white);
