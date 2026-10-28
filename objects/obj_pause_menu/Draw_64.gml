var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

// Latar belakang gelap transparan saat pause
draw_set_color(c_black);
draw_set_alpha(0.75);
draw_rectangle(0, 0, gui_w, gui_h, false);
draw_set_alpha(1.0);

draw_set_font(font_dialog); // Sesuaikan font
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

if (menu_index == 0) {
    // --- TAMPILAN MENU UTAMA PAUSE ---
    draw_set_color(c_white);
    draw_text(gui_w / 2, gui_h / 2 - 80, "=== PAUSE ===");
    
    // Pilihan 0: Lanjutkan
    draw_set_color(selected_main == 0 ? make_color_rgb(212, 175, 55) : c_white);
    draw_text(gui_w / 2, gui_h / 2 - 20, "Lanjutkan Game");
    
    // Pilihan 1: Option
    draw_set_color(selected_main == 1 ? make_color_rgb(212, 175, 55) : c_white);
    draw_text(gui_w / 2, gui_h / 2 + 20, "Option");
    
    // Pilihan 2: Keluar
    draw_set_color(selected_main == 2 ? make_color_rgb(212, 175, 55) : c_white);
    draw_text(gui_w / 2, gui_h / 2 + 60, "Keluar Game");
    
    draw_set_color(c_gray);
    // draw_set_font(-1);  <-- HAPUS BARIS INI
    draw_text(gui_w / 2, gui_h / 2 + 130, "Gunakan Panah Atas/Bawah & Enter");
} 
else if (menu_index == 1) {
    // --- TAMPILAN MENU OPTION (BRIGHTNESS) ---
    draw_set_color(c_white);
    draw_text(gui_w / 2, gui_h / 2 - 60, "=== PENGATURAN BRIGHTNESS ===");
    
    var percent = global.brightness_level;
    
    draw_set_color(make_color_rgb(212, 175, 55));
    draw_text(gui_w / 2, gui_h / 2, "Brightness :   [ - ]   " + string(percent) + "%   [ + ]");
    
    draw_set_color(c_gray);
    // draw_set_font(-1);  <-- HAPUS BARIS INI JUGA
    draw_text(gui_w / 2, gui_h / 2 + 60, "Gunakan Panah Kiri/Kanan untuk Atur | ESC untuk Kembali");
}

// Reset alignment
draw_set_halign(fa_left);
draw_set_valign(fa_top);