draw_set_color(c_red);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// Tampilkan teks HP tepat di pojok kiri atas layar monitor
draw_text(20, 20, "HP: " + string(ceil(global.hp)));