// Gambar sprite kunci (atau lingkaran kuning placeholder)
draw_set_color(c_yellow);
draw_circle(x, y, 12, false);

// Teks petunjuk singkat saat kursor di atas kunci
if (position_meeting(mouse_x, mouse_y, id)) {
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_text(x, y - 25, "[Klik] Ambil Kunci");
    draw_set_halign(fa_left);
}