// If the player is about to reach grapple end, player will be hanging

// naive: if (place_meeting(x+xVelocity, y+yVelocity, obj_env_collide)) {
// stop when trapped: if(place_meeting(x+xvel, y+yvel, grappleToID) || zeroVelocity)
// slow but thorough: if xvel or yvel = 0, check collisions perpendicular to motion
// fast but may break because of other bugs involving grappleTo:
//  check for adjacency with grappleTo OR stop if moving away from grappleTo
zeroVelocity = (xVelocity == 0) && (yVelocity == 0);
oldDist = thisDist;
thisDist = point_distance(x, y, grappleToID.x, grappleToID.y);
doStop = zeroVelocity || (thisDist > oldDist);

xVelocity = grappleXVel;
yVelocity = grappleYVel;
if (doStop || place_meeting(x+xVelocity, y+yVelocity, grappleToID)) {
    if (grappleKey)
        FSMstate = playerFSM.HANG;
    else
        FSMstate = playerFSM.NORMAL;
}

if (yVelocity > 0)
    sprite_index = spr_player_fall;
else if (abs(xVelocity) > abs(yVelocity))
    sprite_index = spr_player_pull;
else
    sprite_index = spr_player_jump;
