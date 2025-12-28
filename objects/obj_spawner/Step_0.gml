/// obj_spawner Step Event

if (enemies_spawned < enemies_to_spawn) {
    spawn_timer += 1;

    if (spawn_timer >= spawn_interval) {
        spawn_timer = 0;

        // Spawn enemy with random x position in band
        var spawn_x = spawn_x_min + random(spawn_x_max - spawn_x_min);
        instance_create_layer(spawn_x, spawn_y, "Instances", obj_enemy);

        enemies_spawned += 1;
    }
} else {
    // All enemies spawned
    game.spawning_complete = true;
    instance_destroy();
}
