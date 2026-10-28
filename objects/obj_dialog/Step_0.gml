// Input tombol F untuk lanjut percakapan
var key_next = keyboard_check_pressed(ord("F"));

// Efek teks mengetik berjalan
var current_text = text[text_index];
if (char_index < string_length(current_text)) {
    char_index += text_speed;
}

if (key_next) {
    // Jika teks belum selesai mengetik, langsung tampilkan penuh
    if (char_index < string_length(current_text)) {
        char_index = string_length(current_text);
    } 
    // Jika teks sudah tampil penuh, lanjut ke kalimat berikutnya
    else {
        text_index += 1;
        char_index = 0; // Reset efek ketik
        
        // Jika dialog sudah habis, tutup dialog box
        if (text_index >= array_length(text)) {
            if (instance_exists(obj_player)) {
                obj_player.is_attacking = false; // Kembalikan kontrol ke Baskara
            }
            instance_destroy(); // Hapus objek dialog
        }
    }
}