if (!global.game_paused) {
	
	if (damage_cooldown > 0) {
    damage_cooldown--;
	}
	
    // Kurangi timer kombo setiap frame jika sedang tidak menyerang
    if (combo_timer > 0) {
        combo_timer -= 1;
    } else {
        combo_step = 1; // Jika lewat dari 1 detik tidak menyerang, reset kembali ke Hit 1
    }

    
    // 1. Input Serang (hanya setelah mengambil senjata)
    var attack_input = mouse_check_button_pressed(mb_left)
        || keyboard_check_pressed(vk_space);

    if (attack_input && !is_attacking && global.has_wood_weapon) {
        is_attacking = true;
        image_index = 0;

        // Tentukan arah hadap Baskara
        var is_facing_left = (
            sprite_index == walk_baskara_left
            || sprite_index == run_baskara_left
            || sprite_index == idle_baskara_left
            || sprite_index == attack_baskara_left
            || sprite_index == attack_2_baskara_left
            || sprite_index == idle_baskara_weapon_left
            || sprite_index == walk_baskara_weapon_left
            || sprite_index == run_baskara_weapon_left
        );

        // Cek jangkauan serangan
        var hit_range = 150;
        var check_x = is_facing_left ? x - hit_range : x + hit_range;
        var enemy_hit = instance_place(check_x, y, obj_the_ash);

        // Kombo Hit 1
        if (combo_step == 1) {
            sprite_index = is_facing_left
                ? attack_baskara_left
                : attack_baskara_right;

            var sfx = audio_play_sound(snd_attack, 1, false);
            audio_sound_pitch(sfx, random_range(0.8, 1.2));

            if (enemy_hit != noone) {
                enemy_hit.hp_ash -= 1;
                enemy_hit.is_hurt = true;
                enemy_hit.hurt_timer = 30;

                var knockback_distance = 35;

                if (x < enemy_hit.x) {
                    enemy_hit.x += knockback_distance;
                } else {
                    enemy_hit.x -= knockback_distance;
                }
            }

            combo_step = 2;
            combo_timer = 60;
        }
        // Kombo Hit 2
        else if (combo_step == 2) {
            sprite_index = is_facing_left
                ? attack_2_baskara_left
                : attack_2_baskara_right;

            var sfx = audio_play_sound(snd_attack, 1, false);
            audio_sound_pitch(sfx, random_range(0.8, 1.2));

            if (enemy_hit != noone) {
                enemy_hit.hp_ash -= 1;
                enemy_hit.is_hurt = true;
                enemy_hit.hurt_timer = 30;

                var knockback_distance = 50;

                if (x < enemy_hit.x) {
                    enemy_hit.x += knockback_distance;
                } else {
                    enemy_hit.x -= knockback_distance;
                }
            }

            combo_step = 1;
            combo_timer = 0;
        }
    }

    // 2. Jika Sedang Menyerang -> Kunci Pergerakan
    if (is_attacking) {
        image_speed = 1;
        
        // Otomatis akhiri status menyerang saat animasinya habis (Animation End Event alternatif di Step)
        if (image_index >= image_number - 1) {
            is_attacking = false;
        } 
    } else {
        // 3. Input Pergerakan (Jalan / Lari)
        var move_left  = keyboard_check(ord("A")) || keyboard_check(vk_left);
        var move_right = keyboard_check(ord("D")) || keyboard_check(vk_right);
        var is_running = keyboard_check(vk_shift);

        var move_speed = is_running ? 6 : 3;
        var move_dir   = move_right - move_left;

        if (move_dir != 0) {
            var target_speed = move_dir * move_speed;
            
            // --- MAINKAN SOUND JALAN / LARI ---
            if (!audio_is_playing(walk_sfx_id)) {
                walk_sfx_id = audio_play_sound(snd_walk, 1, true); 
            }
            
            if (is_running) {
                audio_sound_pitch(walk_sfx_id, 1.5); 
            } else {
                audio_sound_pitch(walk_sfx_id, 1.0); 
            }
            
            if (!place_meeting(x + target_speed, y, obj_the_ash)) {
                x += target_speed;
            } else {
                while (!place_meeting(x + move_dir, y, obj_the_ash)) {
                    x += move_dir;
                }
            }
			
			
			if (global.has_wood_weapon) {
			    if (move_dir > 0) {
			        sprite_index = is_running
			            ? run_baskara_weapon_right
			            : walk_baskara_weapon_right;
			    } else {
			        sprite_index = is_running
			            ? run_baskara_weapon_left
			            : walk_baskara_weapon_left;
			    }
			} else {
			    if (move_dir > 0) {
			        sprite_index = is_running
			            ? run_baskara_right
			            : walk_baskara_right;
			    } else {
			        sprite_index = is_running
			            ? run_baskara_left
			            : walk_baskara_left;
			    }
			}

            image_speed = 1;
        } else {
            // --- MATIKAN SOUND JIKA BERHENTI (IDLE) ---
            if (audio_is_playing(walk_sfx_id)) {
                audio_stop_sound(walk_sfx_id);
                walk_sfx_id = noone;
            }
            
            // Diam / Idle         
			if (global.has_wood_weapon) {
			    if (
			        sprite_index == walk_baskara_weapon_left
			        || sprite_index == run_baskara_weapon_left
			        || sprite_index == hurt_baskara_weapon_left
			    ) {
			        sprite_index = idle_baskara_weapon_left;
			    } else if (
			        sprite_index == walk_baskara_weapon_right
			        || sprite_index == run_baskara_weapon_right
			        || sprite_index == hurt_baskara_weapon_right
			    ) {
			        sprite_index = idle_baskara_weapon_right;
			    }
			} else {
			    if (
			        sprite_index == walk_baskara_left
			        || sprite_index == run_baskara_left
			        || sprite_index == attack_baskara_left
			        || sprite_index == attack_2_baskara_left
			    ) {
			        sprite_index = idle_baskara_left;
			    } else if (
			        sprite_index == walk_baskara_right
			        || sprite_index == run_baskara_right
			        || sprite_index == attack_baskara_right
			        || sprite_index == attack_2_baskara_right
			    ) {
			        sprite_index = idle_baskara_right;
			    }
			}

			image_speed = 0.5;

        }
    }
} else {
    // --- TAMBAHKAN INI: MATIKAN JUGA JIKA GAME PAUSED ATAU DIALOG AKTIF ---
    if (audio_is_playing(walk_sfx_id)) {
        audio_stop_sound(walk_sfx_id);
        walk_sfx_id = noone;
    }
    image_speed = 0;
}

// Jika tombol ESC ditekan dan menu pause belum ada di layar
if (keyboard_check_pressed(vk_escape)) {
    if (!instance_exists(obj_pause_menu)) {
        // Panggil/munculkan objek pause menu di layar
        instance_create_layer(0, 0, layer, obj_pause_menu);
    }
}