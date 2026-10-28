// Cek jika pemain mengklik kunci yang muncul di bingkai
if (position_meeting(mouse_x, mouse_y, id)) {
    global.has_key = true; // Kunci arc berhasil didapat!
    show_debug_message("Kunci berhasil diambil!");
    
    instance_destroy(); // Hapus kunci
}