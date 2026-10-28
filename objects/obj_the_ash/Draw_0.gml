// 1. Gambar sprite asli The Ash (idle/walk/run yang lagi aktif)
draw_self();

// 2. Tampilkan indikator HP di atas kepalanya
draw_set_color(c_red);
draw_text(x - 15, y - 80, "HP: " + string(hp_ash));