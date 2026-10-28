if (already_triggered && dialog_index < array_length(dialog_list)) {
    // 1. Dapatkan ukuran pasti GUI / Viewport Kamera saat ini
    var gui_w = display_get_gui_width();
    var gui_h = display_get_gui_height();

    // 2. Set ukuran Box Dialog (Lebar 80% dari layar, posisi persis di Bawah Tengah)
    var box_w = gui_w * 0.85; // Lebar kotak 85% layar
    var box_h = 120;          // Sedikit ditambah tingginya dari 110 jadi 120 biar lega untuk teks besar
    
    var box_x1 = (gui_w - box_w) / 2; // Otomatis Rata Tengah (Center)
    var box_y1 = gui_h - box_h - 20;  // Jarak 20px dari batas bawah layar
    var box_x2 = box_x1 + box_w;
    var box_y2 = box_y1 + box_h;

    // --- GAMBAR KOTAK DIALOG UTAMA ---
    draw_set_color(c_black);
    draw_set_alpha(0.85);
    draw_rectangle(box_x1, box_y1, box_x2, box_y2, false);

    draw_set_color(make_color_rgb(212, 175, 55)); // Border Emas
    draw_set_alpha(1);
    draw_rectangle(box_x1, box_y1, box_x2, box_y2, true);

    // --- GAMBAR NAMEPLATE (Di Atas Kiri Kotak Dialog) ---
    var name_w = 140;
    var name_h = 28;
    var name_x1 = box_x1 + 10;
    var name_y1 = box_y1 - name_h;
    var name_x2 = name_x1 + name_w;
    var name_y2 = box_y1;

    // Warna Nameplate sesuai pembicara
    var current_speaker = dialog_speaker[dialog_index];
    if (current_speaker == "Nada") {
        draw_set_color(make_color_rgb(20, 80, 100)); // Toska
    } else {
        draw_set_color(make_color_rgb(100, 20, 20)); // Merah Baskara
    }
    draw_rectangle(name_x1, name_y1, name_x2, name_y2, false);

    draw_set_color(make_color_rgb(212, 175, 55));
    draw_rectangle(name_x1, name_y1, name_x2, name_y2, true);

    // Nama Karakter (Ukuran Normal / Tengah Nameplate)
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text((name_x1 + name_x2) / 2, (name_y1 + name_y2) / 2, current_speaker);

    // --- TEKS DIALOG (ANIMASI KETIK & DIPERBESAR) ---
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);

    var current_text = dialog_list[dialog_index];
    var text_to_draw = string_copy(current_text, 1, floor(char_index));

    draw_set_color(c_white);
    
    // --- PENGATUR SKALA UKURAN TEKS DIALOG ---
    var text_scale = 1.1; // Ubah angka ini (misal 1.5 atau 2) kalau kurang besar/kebanyakan
    
    // Menggunakan transformed agar teks membesar tanpa menyentuh ukuran nameplate
    draw_text_ext_transformed(
        box_x1 + 20, 
        box_y1 + 18, 
        text_to_draw, 
        24 * text_scale, 
        ((box_w - 40) / text_scale), 
        text_scale, 
        text_scale, 
        0
    );

    // --- INDIKATOR TOMBOL [F] ---
    draw_set_color(make_color_rgb(212, 175, 55));
    if (char_index >= string_length(current_text)) {
        draw_text(box_x2 - 110, box_y2 - 28, "[F] Lanjut v");
    } else {
        draw_text(box_x2 - 110, box_y2 - 28, "[F] Skip >");
    }
}