if (!global.game_paused && instance_exists(obj_player)) {
    if (point_distance(x, y, obj_player.x, obj_player.y) < 120 && keyboard_check_pressed(ord("E"))) {
        
		// --- MAINKAN SOUND EFFECT BUKA PINTU ---
        audio_play_sound(snd_open_door, 1, false);
		
        // SIMPAN posisi Baskara sekarang di room utama sebelum masuk, 
        // atau simpan posisi persis di depan pintu ini supaya pas keluar dia berdiri di sini lagi!
        global.return_x = obj_player.x; 
        global.return_y = obj_player.y;
        
        // Tentukan koordinat spawn Baskara pas sampai di room ARC_1_DOOR (di dalam ruangan)
        global.target_x = 120; 
        global.target_y = 350;
        
        room_goto(ARC_1_DOOR); 
    }
}