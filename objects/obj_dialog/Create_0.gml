text = [];             // Array penampung kalimat dialog
text_index = 0;        // Indeks kalimat yang sedang tampil
speaker_name = "";     // Nama karakter yang bicara (misal: "Baskara", "The Ash")
portrait = -1;         // sprite foto, -1 = tanpa foto
mirror = false;        // true = foto di kanan (lawan bicara)

// Efek teks mengetik (typewriter effect)
char_index = 0;
text_speed = 0.5;

// --- Pengaturan gambar dialog ---
box_sprite = spr_dialogue_box;
box_scale = 1;     // skala gambar
box_margin_b = 20;    // jarak dari tepi bawah layar

name_off_x = 40;    // posisi nama relatif terhadap pojok kiri atas gambar
name_off_y = 12;
text_off_x = 40;    // posisi isi teks
text_off_y = 55;
text_pad_r = 40;    // ruang kosong di kanan teks
line_height = 30;

// Hentikan pergerakan Baskara saat dialog muncul
if (instance_exists(obj_player)) {
    obj_player.is_attacking = true; // Supaya Baskara diam dan tidak bisa bergerak/menyerang
}