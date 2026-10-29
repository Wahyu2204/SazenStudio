var key_next = keyboard_check_pressed(vk_enter);
var current_text = dialog_list[dialog_index];

// 1. Jalankan efek animasi ngetik
if (char_index < string_length(current_text)) {
    char_index += text_speed;
}

// 2. Logika Tombol F (2 Fungsi)
if (key_next) {
    // Fungsi 1: Jika teks BELUM selesai ngetik -> langsung buka penuh
    if (char_index < string_length(current_text)) {
        char_index = string_length(current_text);
    } 
    // Fungsi 2: Jika teks SUDAH penuh -> lanjut ke dialog berikutnya
    else {
        dialog_index += 1;
        char_index = 0; // Reset efek ngetik untuk dialog baru
        
        // Jika semua dialog sudah selesai
        if (dialog_index >= array_length(dialog_list)) {
            
            global.dialog_arc1_done = true; // <--- TARUH DI SINI BRO!
            
            global.game_paused = false; // UNPAUSE GAME!
            
            if (instance_exists(obj_player)) {
                obj_player.is_attacking = false;
            }
            
            instance_destroy(); // Tutup & hapus objek dialog
        }
    }
}