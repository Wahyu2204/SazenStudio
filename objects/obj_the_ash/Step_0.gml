if (!global.game_paused) {
    image_speed = 1;

    // --- JIKA SUDAH MATI (PRIORITAS UTAMA) ---
    if (is_dead) {
        // Kunci sprite death agar tidak tertimpa animasi lain
        if (facing_direction == "left") {
            sprite_index = death_the_ash_left;
        } else {
            sprite_index = death_the_ash_right;
        }
        
        image_speed = 1; // Pastikan animasi berjalan normal
        
        // Tunggu sampai frame animasi death benar-benar habis (frame terakhir)
        if (image_index >= image_number - 1) {
            image_speed = 0; // Tahan di frame terakhir (opsional, biar mayatnya diam sebentar sebelum hilang)
            
            // Atau kalau mau langsung hancur pas kelar frame terakhir:
            instance_destroy();
        }
        
        exit; // Hentikan seluruh sisa script di bawahnya agar tidak memproses kejar/patroli/hurt lagi
    }

    // Hitung jarak ke Baskara
    var dist_x = 9999;
    var dist_y = 9999;
    if (instance_exists(obj_player)) {
        dist_x = abs(obj_player.x - x);
        dist_y = abs(obj_player.y - y);
    }

    var is_chasing = (instance_exists(obj_player) && dist_x < detect_range && dist_y < 100);

    // --- 1. LOGIKA HURT ---
    if (is_hurt) {
        hurt_timer -= 1;
        
        if (is_chasing) {
            sprite_index = (facing_direction == "left") ? hurt_run_the_ash_left : hurt_run_the_ash_right;
        } 
        else if (move_dir != 0) {
            sprite_index = (facing_direction == "left") ? hurt_walk_the_ash_left : hurt_walk_the_ash_right;
        } 
        else {
            sprite_index = (facing_direction == "left") ? hurt_idle_the_ash_left : hurt_idle_the_ash_right;
        }

        if (hurt_timer <= 0) {
            is_hurt = false; 
        }
    } 
    // --- 2. LOGIKA NORMAL (KEJAR / PATROLI) ---
    else {
        if (instance_exists(obj_player)) {
            if (is_chasing) {
                if (obj_player.x < x) {
                    x -= chase_speed;
                    facing_direction = "left";
                    sprite_index = run_the_ash_left;
                } else {
                    x += chase_speed;
                    facing_direction = "right";
                    sprite_index = run_the_ash_right;
                }
                image_speed = 1;
            } 
            else {
                x += move_dir * move_speed;
                
                if (move_dir < 0) {
                    facing_direction = "left";
                    sprite_index = walk_the_ash_left;
                } else {
                    facing_direction = "right";
                    sprite_index = walk_the_ash_right;
                }
                image_speed = 0.8;
                
                patrol_timer -= 1;
                if (patrol_timer <= 0) {
                    move_dir *= -1;       
                    patrol_timer = 120;   
                }
            }
        } else {
            if (facing_direction == "left") {
                sprite_index = idle_the_ash_left;
            } else {
                sprite_index = idle_the_ash_right;
            }
            image_speed = 0.5;
        }
    }

    // --- 3. CEK HP & TRIGGER KEMATIAN ---
    if (hp_ash <= 0 && !is_dead) {
        is_dead = true;
        global.ash_defeated = true; 
        
        if (facing_direction == "left") {
            sprite_index = death_the_ash_left;
        } else {
            sprite_index = death_the_ash_right;
        }
        
        image_index = 0; 
        image_speed = 1; // Putar animasi 1 kali
    }
} else {
    image_speed = 0;
}