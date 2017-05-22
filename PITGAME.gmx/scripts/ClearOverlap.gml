with (obj_env_collide)
    if (place_meeting(x, y, obj_env_collide))
        instance_destroy();
        
with (obj_acid)
    if (place_meeting(x, y, obj_acid))
        instance_destroy();
