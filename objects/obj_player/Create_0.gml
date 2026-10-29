global.game_paused = false;

// Inisialisasi variabel status kunci & spawn
if (!variable_global_exists("has_key")) {
    global.has_key = false; //player blm punya kunci
}
if (!variable_global_exists("target_x")) global.target_x = 0;
if (!variable_global_exists("target_y")) global.target_y = 0;

// Flag penanda apakah dialog intro sudah pernah diputar
if (!variable_global_exists("dialog_intro_done")) global.dialog_intro_done = false;

if (!variable_global_exists("ash_defeated")) global.ash_defeated = false;

//waktu baskara jeda kena damage
damage_cooldown = 0;

global.hp = 100; // Nyawa awal Baskara

global.ash_encounter_seen = false;
global.has_wood_weapon = false;
global.wood_taken = false;

is_attacking = false;
facing_direction = "right"; // Menyimpan arah hadap terakhir ("left" atau "right")

combo_step = 1;      // Menandakan sekarang Hit 1 atau Hit 2
combo_timer = 0;     // Penghitung waktu jeda reset kombo

walk_sfx_id = noone; // Untuk menampung status audio jalan/lari