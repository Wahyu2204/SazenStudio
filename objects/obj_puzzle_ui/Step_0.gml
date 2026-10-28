// 1. Cek Klik Kunci di dalam area Bingkai ini
if (!global.has_key && mouse_check_button_pressed(mb_left)) {
    // Jika kursor mouse mengklik area bingkai ini
    if (position_meeting(mouse_x, mouse_y, id)) {
        global.has_key = true;
        show_debug_message("Kunci berhasil didapatkan dari dalam bingkai!");
    }
}

// 2. Tombol Keluar (ESC) untuk menutup tampilan Zoom-In
if (keyboard_check_pressed(vk_escape)) {
    global.game_paused = false; // Unpause game
    instance_destroy(); // Hapus UI overlay & kembali ke investigasi room
}