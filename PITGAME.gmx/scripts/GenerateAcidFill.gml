// For each obj_acid, generate more acid tiles inside empty blocks beneath the acid

with(obj_acid) {
    sprite_index = spr_acid_diag_b;

    yt = y + 16;
    while(!place_meeting(x, yt, obj_env_collide)) {
        instance_create(x, yt, obj_acid);
        yt += 16;
    }
}
