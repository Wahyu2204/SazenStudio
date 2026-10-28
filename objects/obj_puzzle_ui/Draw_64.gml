// 1. Gambar latar belakang hitam semi-transparan (supaya gelap & fokus)
draw_set_color(c_black);
draw_set_alpha(0.85);
draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
draw_set_alpha(1.0);

// 2. Hitung posisi tengah layar GUI
var center_x = display_get_gui_width() / 2;
var center_y = display_get_gui_height() / 2;

// --- PERBESAR SKALA BINGKAI DI SINI ---
// Kita naikin jadi 8 atau 10 supaya gambarnya besar pas di tengah layar!
var zoom_scale = 2.5; 

// 3. Gambar sprite bingkai ukuran besar
draw_sprite_ext(puzzle_lukisan_arc_1, 0, center_x, center_y, zoom_scale, zoom_scale, 0, c_white, 1);

// 4. LOGIKA KUNCI TERSEMBUNYI DI DALAM BINGKAI
// Tentukan posisi kunci (misalnya pas di tengah-tengah bingkai / area hitam)
var key_x = center_x;
var key_y = center_y;

if (!global.has_key) {
    // Gambar kuncinya (sementara kita pakai lingkaran kuning/emas bercahaya)
    draw_set_color(c_yellow);
    draw_circle(key_x, key_y, 16, false);
    
    // Teks kecil petunjuk
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_text(center_x, center_y + 120, "Cari dan klik kuncinya!");
    
    // Cek jika pemain mengklik posisi kunci tersebut menggunakan mouse GUI
    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);
    
    if (mouse_check_button_pressed(mb_left)) {
        // Jika kursor klik di area sekitar kunci
        if (point_in_rectangle(mx, my, key_x - 30, key_y - 30, key_x + 30, key_y + 30)) {
            global.has_key = true;
            show_debug_message("Kunci di dalam bingkai berhasil diambil!");
        }
    }
} else {
    // Kalau kunci sudah diambil
    draw_set_color(c_lime);
    draw_set_halign(fa_center);
    draw_text(center_x, center_y + 120, "Kunci Berhasil Diambil!");
}

// 5. Teks petunjuk keluar
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_text(center_x, display_get_gui_height() - 60, "Tekan [ESC] untuk Keluar");
draw_set_halign(fa_left);