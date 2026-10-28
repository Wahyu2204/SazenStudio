// Buka pagar jika menekan E dan sudah membawa kunci
if (point_distance(x, y, obj_player.x, obj_player.y) < 48 && keyboard_check_pressed(ord("E"))) {
    if (global.has_key) {
        show_debug_message("Pagar terbuka! Lanjut ke lantai 2.");
        instance_destroy(); // Pagar hancur/terbuka
    } else {
        show_debug_message("Cari kunci dulu di unit ruangan!");
    }
}