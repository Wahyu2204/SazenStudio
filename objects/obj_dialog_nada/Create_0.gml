// Cek apakah dialog Nada sudah pernah diselesaikan sebelumnya secara permanen
if (variable_global_exists("dialog_nada_done") && global.dialog_nada_done == true) {
    instance_destroy();
    exit;
}

// Pemisah Speaker & Teks agar Nameplate berganti otomatis
dialog_speaker = [
    "Nada",
    "Baskara",
    "Baskara"
];

dialog_list = [
    "Ayah...",
    "Nada?",
    "Tidak mungkin..."
];

dialog_index = 0;
already_triggered = false;

// Efek Ketik (Typewriter)
char_index = 0;
text_speed = 0.5;

draw_set_font(font_dialog);