// If the player is about to reach grapple end, player will be hanging

//if (place_meeting(x+xVelocity, y+yVelocity, obj_env_collide)) {
zeroVelocity = (xVelocity == 0 && yVelocity == 0);
xVelocity = grappleXVel;
yVelocity = grappleYVel;
if (place_meeting(x+xVelocity, y+yVelocity, grappleToID) || zeroVelocity) {
    if (grappleKey)
        playerState = playerFSM.HANG;
    else
        playerState = playerFSM.NORMAL;
}

if (yVelocity > 0)
    sprite_index = spr_player_fall;
else if (abs(xVelocity) > abs(yVelocity))
    sprite_index = spr_player_pull;
else
    sprite_index = spr_player_jump;
