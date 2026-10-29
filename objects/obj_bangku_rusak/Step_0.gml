// --- AMBIL BALOK KAYU DARI BANGKU RUSAK ---
if (
    global.ash_encounter_seen
    && !global.has_wood_weapon
    && keyboard_check_pressed(ord("E"))
) {
    var bench = instance_nearest(x, y, obj_bangku_rusak);

    if (
        bench != noone
        && point_distance(x, y, bench.x, bench.y) <= 48
        && !bench.wood_taken
    ) {
        global.has_wood_weapon = true;
        global.wood_taken = true;
        bench.wood_taken = true;
    }
}