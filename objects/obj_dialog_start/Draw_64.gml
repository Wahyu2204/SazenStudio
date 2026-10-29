if (already_triggered && dialog_index < array_length(dialog_list)) {
<<<<<<< HEAD
    draw_dialogue_box(
        dialog_speaker[dialog_index],
        dialog_list[dialog_index],
        char_index,
        dialog_portrait[dialog_index],
        dialog_mirror[dialog_index]
    );
=======
    var gui_w = display_get_gui_width();
    var gui_h = display_get_gui_height();

    // Set ukuran Box Dialog (Rata Tengah Bawah)
    var box_w = gui_w * 0.85;
    var box_h = 110;
    
    var box_x1 = (gui_w - box_w) / 2;
    var box_y1 = gui_h - box_h - 20;
    var box_x2 = box_x1 + box_w;
    var box_y2 = box_y1 + box_h;

    // --- GAMBAR KOTAK DIALOG UTAMA ---
    draw_set_color(c_black);
    draw_set_alpha(0.85);
    draw_rectangle(box_x1, box_y1, box_x2, box_y2, false);

    draw_set_color(make_color_rgb(212, 175, 55)); // Border Emas
    draw_set_alpha(1);
    draw_rectangle(box_x1, box_y1, box_x2, box_y2, true);

    // --- GAMBAR NAMEPLATE BASKARA ---
    var name_w = 140;
    var name_h = 28;
    var name_x1 = box_x1 + 10;
    var name_y1 = box_y1 - name_h;
    var name_x2 = name_x1 + name_w;
    var name_y2 = box_y1;

    draw_set_color(make_color_rgb(100, 20, 20)); // Merah Baskara
    draw_rectangle(name_x1, name_y1, name_x2, name_y2, false);

    draw_set_color(make_color_rgb(212, 175, 55));
    draw_rectangle(name_x1, name_y1, name_x2, name_y2, true);

    // Nama Karakter
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text((name_x1 + name_x2) / 2, (name_y1 + name_y2) / 2, dialog_speaker[dialog_index]);

    // --- TEKS DIALOG (ANIMASI KETIK & DIPERBESAR) ---
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);

    var current_text = dialog_list[dialog_index];
    var text_to_draw = string_copy(current_text, 1, floor(char_index));

    draw_set_color(c_white);
    
    // ATUR UKURAN BESAR TEKS DI SINI
    var text_scale = 1.1; // Ubah angka ini (misal: 1.5, 1.8, atau 2) makin besar makin besar teksnya
    
    // Gunakanfffffadadadfff draw_text_ext_transformed khusus untuk isi dialog
    draw_text_ext_transformed(box_x1 + 20, box_y1 + 18, text_to_draw, 25 * text_scale, ((box_w - 40) / text_scale), text_scale, text_scale, 0);

    // --- INDIKATOR TOMBOL [F] ---
    draw_set_color(make_color_rgb(212, 175, 55));
    if (char_index >= string_length(current_text)) {
        draw_text(box_x2 - 100, box_y2 - 25, "[Enter] Lanjut v");
    } else {
        draw_text(box_x2 - 100, box_y2 - 25, "[Enter] Skip >");
    }
>>>>>>> origin/main
}