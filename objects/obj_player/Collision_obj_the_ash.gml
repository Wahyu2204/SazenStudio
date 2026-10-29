x = x + 0;
y = y + 0;

if (!global.game_paused && damage_cooldown <= 0) {
    global.hp -= 3;
    damage_cooldown = 60;
}