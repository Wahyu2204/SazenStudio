var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

// Posisi & Ukuran Kotak Dialog
var box_x1 = 50;
var box_y1 = gui_h - 150;
var box_x2 = gui_w - 50;
var box_y2 = gui_h - 30;

draw_set_font(font_dialog);

// 1. Gambar Background Kotak Dialog (Hitam Transparan)
draw_set_color(c_black);
draw_set_alpha(0.8);
draw_rectangle(box_x1, box_y1, box_x2, box_y2, false);

// 2. Gambar Border/Garis Tepi Kotak
draw_set_color(c_white);
draw_set_alpha(1);
draw_rectangle(box_x1, box_y1, box_x2, box_y2, true);

// 3. Gambar Nama Pembicara (Ukuran Normal / Tanpa Transform)
draw_set_color(c_yellow);
draw_text(box_x1 + 20, box_y1 + 15, speaker_name);

// 4. Gambar Isi Teks (Dengan Efek Mengetik)
var current_text = text[text_index];
var text_to_draw = string_copy(current_text, 1, floor(char_index));

draw_set_color(c_white);
// Karena font aslinya sudah diperbesar di asset, pakai draw_text_ext biasa saja biar rapi
draw_text_ext(box_x1 + 20, box_y1 + 50, text_to_draw, 30, (box_x2 - box_x1) - 40);

// 5. Indikator Tombol F di pojok kanan bawah (Ukuran Normal)
draw_set_color(c_gray);
draw_text(box_x2 - 140, box_y2 - 30, "[F] Lanjut...");