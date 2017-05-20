// Physics
tmp = xFriction + 0.3 * grounded;
xVelocity = IF (abs(xVelocity) < tmp, 0, xVelocity - sign(xVelocity) * tmp);
xVelocity = sign(xVelocity) * min(abs(xVelocity), xVelocityMax);
yVelocity += grav;
yVelocity = sign(yVelocity) * min(abs(yVelocity), yVelocityMax);

// Upkeep
stunCounter++;
if (stunCounter >= stunFrames) {
    stunCounter = 0;
    stunFrames = 0;
    FSMstate = playerFSM.NORMAL;
}

// Sprite handling
if (xVelocity != 0)
    image_xscale = -sign(xVelocity);

sprite_index = spr_player_stun;
