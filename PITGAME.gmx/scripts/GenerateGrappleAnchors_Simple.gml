//Creates obj_anchor tiles over the top of any obj_env_collide tiles with exposed faces

with (obj_env_collide) {
     left = place_meeting(x-1, y, obj_env_collide);
     right = place_meeting(x+1, y, obj_env_collide);
     up = place_meeting(x, y-1, obj_env_collide);
     down = place_meeting(x, y+1, obj_env_collide);
     if (!(left && right && up && down))
         instance_create(x, y, obj_anchor);
}

show_debug_message(string(instance_number(obj_anchor)) + " anchors generated.");
