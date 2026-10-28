// Ambil data permukaan (surface) video
var results = video_draw();
var video_status = results[0];

// Jika status video aktif/berjalan (kode 0)
if (video_status == 0) {
    var surface_id = results[1];
    
    // Gambar video agar memenuhi layar secara responsif
    if (surface_exists(surface_id)) {
        draw_surface_stretched(surface_id, 0, 0, display_get_gui_width(), display_get_gui_height());
    }
}