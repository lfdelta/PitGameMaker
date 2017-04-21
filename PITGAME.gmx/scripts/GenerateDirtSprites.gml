// Checks through obj_dirt tiles; converts a portion of them to rocks, and converts
// tiles with no above-neighbors to grass.

//randomize();
with (obj_dirt) {
    if (!place_meeting(x, y-1, obj_env_collide) && !place_meeting(x, y-1, obj_acid)) {
        sprite_index = spr_grass_tile;
    }
    else if (!random_range(0,10)) {
        sprite_index = spr_rocks_tile;
        image_index = random_range(0,9);
    }
}
