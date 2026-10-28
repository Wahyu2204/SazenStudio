// Cek tombol klik kiri
if (mouse_check_button_pressed(mb_left)) {
    
    // 1. Pastikan UI puzzle/bingkai TIDAK SEDANG TERBUKA
    if (!instance_exists(obj_puzzle_ui)) {
        
        // 2. Ambil posisi kursor di layar
        var _mx = mouse_x;
        var _my = mouse_y;
        
        // 3. ATUR AREA KOTAK PINTU (Ganti angka ini sesuai posisi pintu di room kamu)
        // Cara lihat koordinat: Arahkan mouse ke pojok kiri-atas lalu kanan-bawah pintu di Room Editor
        var x1 = 300; // Ganti dengan koordinat X kiri pintu
        var y1 = 200; // Ganti dengan koordinat Y atas pintu
        var x2 = 400; // Ganti dengan koordinat X kanan pintu
        var y2 = 800; // Ganti dengan koordinat Y bawah pintu
		
		// --- MAINKAN SOUND EFFECT TUTUP PINTU ---
        audio_play_sound(snd_close_door, 1, false);
        
        // Cek apakah kursor diklik di dalam kotak area pintu tersebut
        if (_mx >= x1 && _mx <= x2 && _my >= y1 && _my <= y2) {
            global.target_x = global.return_x;
			global.target_y = global.return_y;
            room_goto(ARC_1);
        }
    }
}