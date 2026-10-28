// Nonaktifkan semua objek lain di room kecuali objek ini dan controller
instance_deactivate_all(true);
instance_activate_object(obj_brightness_controller); // Biar pengaturnya tetap aktif!

// Status menu: 0 = Menu Pause Utama, 1 = Menu Option (Brightness)
menu_index = 0; 
selected_main = 0; // Pilihan di menu utama (0: Resume, 1: Option, 2: Quit)

// Pastikan nilai global brightness awal ada (rentang 0.0 sampai 1.0)
if (!variable_global_exists("brightness_level")) {
    global.brightness_level = 50; // Default 50%
}