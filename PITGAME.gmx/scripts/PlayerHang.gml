xVelocity = 0;
yVelocity = 0;

if (!grappleKey)
    FSMstate = playerFSM.NORMAL;

if (place_meeting(x, y-1, obj_anchor))
    sprite_index = spr_player_hang;
else if (place_meeting(x, y+1, obj_anchor))
    sprite_index = spr_player_idle;
else
    sprite_index = spr_player_hangwall;
