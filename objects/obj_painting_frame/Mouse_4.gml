// 1. Cek dulu apakah kursor mengklik area pemicu bingkai
if (position_meeting(mouse_x, mouse_y, id)) {
    
    // 2. Cek apakah obj_pizzle_ui belum muncul di layar
    if (!instance_exists(obj_puzzle_ui)) {
        // Buat instance UI overlay zoom bingkai
        instance_create_layer(0, 0, "Instances", obj_puzzle_ui);
        show_debug_message("Berhasil membuka UI puzzle!");
        
        // Hapus input mouse frame ini agar objek pintu di belakangnya TIDAK IKUT TERPANGGIL!
        io_clear(); 
    }
}