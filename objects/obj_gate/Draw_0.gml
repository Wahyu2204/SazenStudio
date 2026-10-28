// Gambar kotak abu-abu sebagai pagar
draw_set_color(c_gray);
draw_rectangle(x - 16, y - 64, x + 16, y, false);

// Tampilkan status pagar saat player mendekat
if (point_distance(x, y, obj_player.x, obj_player.y) < 48) {
    draw_set_color(c_white);
    if (global.has_key) {
        draw_text(x - 40, y - 80, "[E] Buka Pagar");
    } else {
        draw_text(x - 50, y - 80, "Pagar Terkunci!");
    }
}