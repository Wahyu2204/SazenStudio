// Cek apakah ada koordinat target spawn dari room lain
if (global.target_x != 0 && global.target_y != 0) {
    x = global.target_x;
    y = global.target_y;
    
    // Reset kembali ke 0 setelah posisi player dipindahkan
    global.target_x = 0;
    global.target_y = 0;
}