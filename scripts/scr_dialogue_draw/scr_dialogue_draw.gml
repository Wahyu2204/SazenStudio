function draw_dialogue_box(_speaker, _text, _char_index, _portrait, _mirror) {

    // ===== PENGATURAN LAYOUT (pixel sprite asli 2019x366) =====
    var spr = spr_dialogue_box;

    var por_x = 40,  por_y = 72,  por_w = 232, por_h = 250;  // kotak foto
    var name_cx = 587, name_cy = 63;                         // pusat nameplate
    var text_x1 = 350, text_x2 = 1960, text_y = 125;         // area teks
    var ind_y = 295;                                         // posisi indikator
    var line_h = 30;                                         // jarak antar baris (pixel layar)
	var text_pad = 50;   
	
    // ===== PENGATURAN FONT =====
    var font_text   = font_dialog;   // font isi teks
    var font_name   = font_dialog;   // font nama
    var text_scale  = 1.3;           // ukuran isi teks
    var name_scale  = 1.6;           // ukuran nama
    var ind_scale   = 0.9;           // ukuran indikator [Spasi]
    var fake_bold   = false;         // bold isi teks (gambar 2x)
    var name_bold   = true;          // bold nama (gambar 3x)
    // ==========================================================

    var gui_w = display_get_gui_width();
    var gui_h = display_get_gui_height();
    var base_w = sprite_get_width(spr);
    var base_h = sprite_get_height(spr);

    // Skala otomatis: maks 85% lebar layar dan 30% tinggi layar
    var s = min((gui_w * 0.85) / base_w, (gui_h * 0.30) / base_h);

    var spr_w = base_w * s;
    var spr_h = base_h * s;
    var box_x = (gui_w - spr_w) / 2;
    var box_y = gui_h - spr_h - 20;

    // Mirror: xscale negatif, titik asal pindah ke tepi kanan
    var sx = _mirror ? -s : s;
    var ox = _mirror ? box_x + spr_w : box_x;

    draw_set_alpha(1);

    // 1. Kotak dialog
    draw_sprite_ext(spr, 0, ox, box_y, sx, s, 0, c_white, 1);

    // 2. Foto karakter (menutupi kotak putih)
    var pa = ox + por_x * sx;
    var pb = ox + (por_x + por_w) * sx;
    var pl = min(pa, pb);
    var pt = box_y + por_y * s;

    draw_set_color(make_color_rgb(48, 62, 78));
    draw_rectangle(pl, pt, pl + por_w * s, pt + por_h * s, false);
    if (_portrait != -1) {
        draw_sprite_stretched(_portrait, 0, pl, pt, por_w * s, por_h * s);
    }

    // 3. Nama di nameplate
    draw_set_font(font_name);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_white);

    var nx = ox + name_cx * sx;
    var ny = box_y + name_cy * s;

    if (name_bold) {
        draw_text_transformed(nx + 1, ny, _speaker, name_scale, name_scale, 0);
        draw_text_transformed(nx - 1, ny, _speaker, name_scale, name_scale, 0);
    }
    draw_text_transformed(nx, ny, _speaker, name_scale, name_scale, 0);

    // 4. Isi teks (efek ketik)
    var ta = ox + text_x1 * sx;
    var tb = ox + text_x2 * sx;
    var tl = min(ta, tb) + text_pad * s;
    var tr = max(ta, tb);

    var str = string_copy(_text, 1, floor(_char_index));
    var ty  = box_y + text_y * s;
    var lh  = line_h * text_scale;
    var ww  = (tr - tl) / text_scale;

    draw_set_font(font_text);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);

    if (fake_bold) {
        draw_text_ext_transformed(tl + 1, ty, str, lh, ww, text_scale, text_scale, 0);
    }
    draw_text_ext_transformed(tl, ty, str, lh, ww, text_scale, text_scale, 0);

    // 5. Indikator tombol
    var done = (_char_index >= string_length(_text));
    draw_set_halign(fa_right);
    draw_set_color(make_color_rgb(212, 175, 55));
    draw_text_transformed(tr, box_y + ind_y * s, done ? "[Spasi] Lanjut v" : "[Spasi] Skip >", ind_scale, ind_scale, 0);

    // Kembalikan pengaturan
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_color(c_white);
}