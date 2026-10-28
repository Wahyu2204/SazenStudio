// Tombol ESC untuk kembali atau menutup pause
if (keyboard_check_pressed(vk_escape)) {
    if (menu_index == 1) {
        // Kalau sedang di dalam menu Option, kembali ke menu pause utama
        menu_index = 0;
    } else {
        // Kalau sedang di menu utama pause, keluar dari pause (lanjut game)
        instance_destroy();
    }
}

// Navigasi berdasarkan posisi menu saat ini
if (menu_index == 0) {
    // --- DI MENU PAUSE UTAMA ---
    // Pakai Panah Atas / Bawah untuk pilih menu (0: Lanjut, 1: Option, 2: Keluar)
    if (keyboard_check_pressed(vk_down)) {
        selected_main = (selected_main + 1) % 3;
    }
    if (keyboard_check_pressed(vk_up)) {
        selected_main = (selected_main - 1 + 3) % 3;
    }
    
    // Tekan ENTER atau SPASI untuk konfirmasi pilihan
    if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space)) {
        if (selected_main == 0) {
            // Lanjutkan Game
            instance_destroy();
        } 
        else if (selected_main == 1) {
            // Masuk ke Menu Option
            menu_index = 1;
        } 
        else if (selected_main == 2) {
            // Keluar / Restart Game
            game_restart();
        }
    }
} 
else if (menu_index == 1) {
    // --- DI DALAM MENU OPTION (BRIGHTNESS) ---
    if (keyboard_check_pressed(vk_right)) {
        global.brightness_level += 10;
        show_debug_message("Tombol Kanan dipencet! Brightness: " + string(global.brightness_level));
    }
    if (keyboard_check_pressed(vk_left)) {
        global.brightness_level -= 10;
        show_debug_message("Tombol Kiri dipencet! Brightness: " + string(global.brightness_level));
    }
    
    global.brightness_level = clamp(global.brightness_level, 0, 100);
}