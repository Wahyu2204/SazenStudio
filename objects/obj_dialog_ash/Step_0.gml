// 1. Cek jika Baskara mendekat (jarak < 100px) dan dialog belum terpicu
if (!already_triggered && instance_exists(obj_player)) {
    if (point_distance(x, y, obj_player.x, obj_player.y) < 100) {
        already_triggered = true;
        global.game_paused = true; // PAUSE GAME PAS BASKARA KAGET NGELIAT THE ASH
        show_debug_message("Dialog Ash Terpicu!");
    }
}

// 2. Jika dialog sudah terpicu dan belum selesai
if (already_triggered) {
    var key_next = keyboard_check_pressed(ord("F"));
    var current_text = dialog_list[dialog_index];

    // Animasi teks mengetik
    if (char_index < string_length(current_text)) {
        char_index += text_speed;
    }

    // Logika Tombol F (2 Fungsi)
    if (key_next) {
        // Fungsi 1: Jika teks BELUM selesai ngetik -> langsung buka penuh
        if (char_index < string_length(current_text)) {
            char_index = string_length(current_text);
        } 
        // Fungsi 2: Jika teks SUDAH penuh -> lanjut ke dialog berikutnya
        else {
            dialog_index += 1;
            char_index = 0; // Reset efek ketik
            
            // Jika semua dialog sudah selesai
            if (dialog_index >= array_length(dialog_list)) {
                
                global.dialog_ash_done = true; // <--- TANDAI DIALOG ASH TAMAT SELAMANYA!
                
                global.game_paused = false; // UNPAUSE GAME!
                
                if (instance_exists(obj_player)) {
                    obj_player.is_attacking = false;
                }
                
                instance_destroy(); // Hapus pemicu dialog
            }
        }
    }
}