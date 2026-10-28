// Ambil status video saat ini
var status = video_get_status();

// Tombol Skip (Spasi, Enter, atau Esc)
var key_skip = keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_escape);

// Jika video selesai diputar ATAU ditekan tombol skip
if (status == video_status_closed || key_skip) {
    video_close();          // Tutup player video
    room_goto(ARC_1);       // Lanjut masuk ke room gameplay ARC_1
}