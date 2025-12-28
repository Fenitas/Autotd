// Enemy Spawner - Step Event

spawn_timer++;

// Spawn enemies at intervals
if (spawn_timer >= spawn_delay) {
    if (enemies_spawned < enemies_to_spawn) {
        // Spawn enemy at random x position along top
        var _spawn_x = irandom_range(spawn_min_x, spawn_max_x);
        instance_create_depth(_spawn_x, spawn_y, 0, obj_enemy);

        enemies_spawned++;
        spawn_timer = 0;
    } else {
        // All enemies spawned, destroy spawner
        instance_destroy();
    }
}
