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
if (grappleKey) {
    theta = arctan2(mouse_y - y, mouse_x - x);
    grappleReachX = x + grappleReach * cos(theta);
    grappleReachY = y + grappleReach * sin(theta);
    grappleToID = Raycast(x, y, grappleReachX, grappleReachY, obj_env_collide, false, true);
    grappleTo = RaycastToPoint(x, y, grappleReachX, grappleReachY, obj_anchor, false, true);
        
    // If grappleTo exists, player can grapple to it
    if(!is_undefined(grappleTo[0])) {
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
