
if (!global.game_paused) {
    image_speed = 1;

    // --- 1. JIKA SUDAH MATI ---
    if (is_dead) {
        if (facing_direction == "left") {
            sprite_index = death_the_ash_left;
        } else {
            sprite_index = death_the_ash_right;
        }

        image_speed = 1;

        if (image_index >= image_number - 1) {
            image_speed = 0;
            instance_destroy();
        }

        exit;
    }

    // --- 2. CEK JARAK BASKARA ---
    var dist_x = 9999;
    var dist_y = 9999;

    if (instance_exists(obj_player)) {
        dist_x = abs(obj_player.x - x);
        dist_y = abs(obj_player.y - y);
    }

    // The Ash mulai mengejar jika Baskara mendekat
    var is_chasing = (
        instance_exists(obj_player)
        && dist_x < detect_range
        && dist_y < 100
    );

    // --- 3. LOGIKA HURT ---
    if (is_hurt) {
        hurt_timer -= 1;

        if (is_chasing) {
            sprite_index = (facing_direction == "left")
                ? hurt_run_the_ash_left
                : hurt_run_the_ash_right;
        } else {
            sprite_index = (facing_direction == "left")
                ? hurt_idle_the_ash_left
                : hurt_idle_the_ash_right;
        }

        if (hurt_timer <= 0) {
            is_hurt = false;
        }
    }

    // --- 4. LOGIKA KEJAR DAN IDLE ---
    else {
        if (is_chasing) {

            // Kejar Baskara
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

        } else {

            // Baskara belum dekat: diam di tempat
            if (facing_direction == "left") {
                sprite_index = idle_the_ash_left;
            } else {
                sprite_index = idle_the_ash_right;
            }

            image_speed = 0.5;
        }
    }

    // --- 5. CEK HP DAN TRIGGER KEMATIAN ---
    if (hp_ash <= 0 && !is_dead) {
        is_dead = true;
        global.ash_defeated = true;

        if (facing_direction == "left") {
            sprite_index = death_the_ash_left;
        } else {
            sprite_index = death_the_ash_right;
        }

        image_index = 0;
        image_speed = 1;
    }

} else {
    image_speed = 0;
}
