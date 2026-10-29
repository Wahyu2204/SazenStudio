// Cek apakah dialog Ash sudah pernah diselesaikan sebelumnya secara permanen
if (variable_global_exists("dialog_ash_done") && global.dialog_ash_done == true) {
    instance_destroy();
    exit;
}

dialog_speaker = [
    "Baskara",
    "Baskara"
];

// masukan foto dan apakah miror atau tidak
dialog_portrait = [baskara_normal, baskara_normal];
dialog_mirror   = [false, false];

dialog_list = [
    "Astaga makhluk apa ini... kenapa badanku terasa terbakar ketika dia menyentuhku?",
    "Aku tidak punya pilihan lain... aku harus melawannya"
];

dialog_index = 0;
already_triggered = false;

// Efek Ketik (Typewriter)
char_index = 0;
text_speed = 0.5;

draw_set_font(font_dialog);