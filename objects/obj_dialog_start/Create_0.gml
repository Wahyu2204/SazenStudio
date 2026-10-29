// 1. Cek apakah dialog intro ARC_1 sudah pernah diselesaikan secara global
if (variable_global_exists("dialog_arc1_done") && global.dialog_arc1_done == true) {
    // Kalau sudah pernah selesai, hancurkan objek pemicu dialog ini seketika!
    instance_destroy();
    exit;
}

// --- KODE LAMA KAMU DI BAWAH INI ---
dialog_speaker = [
    "Baskara",
    "Baskara"
];

// masukan foto dan apakah miror atau tidak
dialog_portrait = [baskara_normal, baskara_normal];
dialog_mirror   = [false, false];

dialog_list = [
    "Dimana aku...?",
    "Ini seperti rusun tempatku tinggal."
];

dialog_index = 0;
already_triggered = true; 

// Efek Ketik (Typewriter)
char_index = 0;
text_speed = 0.5;

// Langsung pause game pas room mulai
global.game_paused = true;