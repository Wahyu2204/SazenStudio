// Jika The Ash sudah pernah dibunuh sebelumnya, langsung hancurkan objeknya!
if (variable_global_exists("ash_defeated") && global.ash_defeated == true) {
    instance_destroy();
    exit;
}

hp_ash = 3; // Membutuhkan 3 kali pukulan untuk hancur

move_speed = 1.5;     // Kecepatan jalan patroli
chase_speed = 2.5;    // Kecepatan lari mengejar Baskara
detect_range = 300;   // Jarak deteksi (radius 300px)

facing_direction = "left"; // Arah hadap awal
move_dir = -1;             // -1 ke kiri, 1 ke kanan
patrol_timer = 120;        // Timer bolak-balik (120 frame = 2 detik)

is_hurt = false;
hurt_timer = 0;

is_dead = false;