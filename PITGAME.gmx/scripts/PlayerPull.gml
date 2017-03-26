// If the player is about to reach grapple end, player will be hanging
if (place_meeting(x+xVelocity, y+yVelocity, obj_env_collide)) {
    playerState = playerFSM.HANG;
}
