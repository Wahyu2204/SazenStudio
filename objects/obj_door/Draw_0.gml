// 1. Gambar sprite pintu aslinya
draw_self();

// 2. Logika teks petunjuk (jarak diperbesar & teks dinaikkan)
if (point_distance(x, y, obj_player.x, obj_player.y) < 120) {
    draw_set_color(c_white);
    draw_set_halign(fa_center); // Bikin teks rata tengah rapi di atas pintu
    
    // Teks digambar di posisi x tengah pintu dan Y dinaikkan ke atas
    draw_text(x, y - 100, "[E] Periksa Pintu");
    
    draw_set_halign(fa_left); // Reset Alignment ke default
}