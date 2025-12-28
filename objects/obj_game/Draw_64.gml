// Game Manager - Draw GUI Event

draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// Draw game stats
var _ui_x = 10;
var _ui_y = 10;
var _line_height = 20;

draw_text(_ui_x, _ui_y, "Phase: " + phase);
draw_text(_ui_x, _ui_y + _line_height, "Wave: " + string(wave));
draw_text(_ui_x, _ui_y + _line_height * 2, "Gold: " + string(gold));

var _enemies_alive = instance_number(obj_enemy);
var _allies_alive = instance_number(obj_unit);

draw_text(_ui_x, _ui_y + _line_height * 3, "Enemies: " + string(_enemies_alive));
draw_text(_ui_x, _ui_y + _line_height * 4, "Allies: " + string(_allies_alive));

// Draw "Start Wave" button during BUILD phase
if (phase == "BUILD") {
    var _btn_x = room_width / 2 - 60;
    var _btn_y = 10;
    var _btn_w = 120;
    var _btn_h = 30;

    if (draw_button(_btn_x, _btn_y, _btn_w, _btn_h, "Start Wave")) {
        // Start wave phase
        phase = "WAVE";

        // Spawn enemies
        instance_create_depth(room_width / 2, 0, 0, obj_spawner);
    }
}

// Draw low gold message
if (show_low_gold_message) {
    draw_set_color(c_red);
    draw_set_halign(fa_center);
    draw_text(room_width / 2, room_height / 2, "Not enough gold!");
    draw_set_halign(fa_left);
}
