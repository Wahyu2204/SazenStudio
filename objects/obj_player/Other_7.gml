// Reset status menyerang setelah animasi selesai
if (is_attacking) {
    is_attacking = false;
    
    if (facing_direction == "left") {
        sprite_index = idle_baskara_left;
    } else {
        sprite_index = idle_baskara_right;
    }
}