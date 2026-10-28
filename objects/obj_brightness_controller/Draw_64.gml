var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

if (!variable_global_exists("brightness_level")) {
    global.brightness_level = 50;
}

// Ubah angka pengali di belakang (misal dari 0.75 jadi 0.35 biar jauh lebih terang!)
// Semakin kecil angkanya, semakin tipis kotak hitamnya di semua level.
var dark_alpha = (1.0 - (global.brightness_level / 100)) * 0.2;

// Batasi alpha minimal 0
dark_alpha = clamp(dark_alpha, 0, 0.2);

if (dark_alpha > 0) {
    draw_set_color(c_black);
    draw_set_alpha(dark_alpha);
    draw_rectangle(0, 0, gui_w, gui_h, false);
    draw_set_alpha(1.0); // Reset alpha
}