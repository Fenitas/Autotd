// Allied Unit - Draw Event

// Draw unit (blue circle)
draw_set_color(c_blue);
draw_circle(x, y, 16, false);

// Draw border
draw_set_color(c_white);
draw_circle(x, y, 16, true);

// Draw health bar
var _bar_width = 32;
var _bar_height = 4;
var _bar_x = x - _bar_width / 2;
var _bar_y = y - 24;

// Background
draw_set_color(c_black);
draw_rectangle(_bar_x, _bar_y, _bar_x + _bar_width, _bar_y + _bar_height, false);

// Health
var _health_width = (_bar_width * hp) / max_hp;
draw_set_color(c_lime);
draw_rectangle(_bar_x, _bar_y, _bar_x + _health_width, _bar_y + _bar_height, false);

// Border
draw_set_color(c_white);
draw_rectangle(_bar_x, _bar_y, _bar_x + _bar_width, _bar_y + _bar_height, true);
