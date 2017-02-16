//Creates obj_anchor tiles over the top of any obj_player_collide tiles with exposed faces

with (obj_player_collide) {
     left = place_meeting(x-1, y, obj_player_collide);
     right = place_meeting(x+1, y, obj_player_collide);
     up = place_meeting(x, y-1, obj_player_collide);
     down = place_meeting(x, y+1, obj_player_collide);
     if (!(left && right && up && down))
         instance_create(x-8, y-8, obj_anchor);
}

show_debug_message(string(instance_number(obj_anchor)) + " anchors generated.");
