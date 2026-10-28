text = [];             // Array penampung kalimat dialog
text_index = 0;        // Indeks kalimat yang sedang tampil
speaker_name = "";     // Nama karakter yang bicara (misal: "Baskara", "The Ash")

// Efek teks mengetik (typewriter effect)
char_index = 0;
text_speed = 0.5;

// Hentikan pergerakan Baskara saat dialog muncul
if (instance_exists(obj_player)) {
    obj_player.is_attacking = true; // Supaya Baskara diam dan tidak bisa bergerak/menyerang
}