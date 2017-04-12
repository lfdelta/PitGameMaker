// Physics
grounded = place_meeting(x, y+1, obj_env_collide);
xVelocity += moveDirection * xAcceleration; // this could probably be optimized
tmp = xFriction + 0.3 * grounded;
xVelocity = IF (abs(xVelocity) < tmp, 0, xVelocity - sign(xVelocity) * tmp);
xVelocity = sign(xVelocity) * min(abs(xVelocity), xVelocityMax);
yVelocity += grav;
yVelocity = sign(yVelocity) * min(abs(yVelocity), yVelocityMax);
if (grounded)
    yVelocity = -jumpKey * jumpSpeed;
if (yVelocity < 0 && !jumpKey)
    yVelocity = max(yVelocity, -jumpSpeed/4);

// Attempt grapple -> transition into PULL state
// Give enemy attacks precedence over grappling because attacking when one intends
// to grapple is less costly than the other way around, since grappling takes away
// player control for some time.
if (grappleKey) {
    theta = arctan2(mouse_y - y, mouse_x - x);
    grappleReachX = x + grappleReach * cos(theta);
    grappleReachY = y + grappleReach * sin(theta);

    if (grappleKey_P) {
        grappleAtkID = Raycast(x, y, grappleReachX, grappleReachY, obj_enemy, false, true);
        if(grappleAtkID != noone) {
            grappleAtkID.hp -= grappleDmg;
            show_debug_message("hit "+string(grappleAtkID)+": "+string(grappleAtkID.hp));
        }
    }    
        
    grappleToID = Raycast(x, y, grappleReachX, grappleReachY, obj_env_collide, false, true);
    grappleTo = RaycastToPoint(x, y, grappleReachX, grappleReachY, obj_anchor, false, true);
        
    // If no enemy is in the way and grappleTo exists, player can grapple to it
    if(grappleAtkID == noone && !is_undefined(grappleTo[0])) {
        show_debug_message(grappleAtkID);
        // Move player toward the grapple point
        vx = grappleTo[0] - x;
        vy = grappleTo[1] - y;

        lengthOfVector = sqrt(vx*vx + vy*vy);
    
        xVelocity = grappleSpeed * (vx/lengthOfVector);
        yVelocity = grappleSpeed * (vy/lengthOfVector);
        if (place_meeting(x+xVelocity, y+yVelocity, obj_env_collide)) {
            playerState = playerFSM.HANG;
        } else {
            playerState = playerFSM.PULL;
        }
    }
}

// Sprite handling
if (xVelocity != 0)
    image_xscale = sign(xVelocity);
    
if (grounded) {
    image_speed = 0.25;
    if (abs(xVelocity) < 0.1) {
        sprite_index = spr_player_idle;
    } else {
        sprite_index = spr_player_run;
    }
} else if (yVelocity < 1) { // small buffer before switching from jump to fall
    sprite_index = spr_player_jump;
} else {
    sprite_index = spr_player_fall;
}
