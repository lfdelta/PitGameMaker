/// HandleCollision(objID, colliderID)

objID = argument0;
colliderID = argument1;

with (objID) {
    if (place_meeting(x+xVelocity, y+yVelocity, colliderID)) {
        is_vertical = abs(yVelocity) >= abs(xVelocity);
        slope = IF(is_vertical, abs(xVelocity/yVelocity), abs(yVelocity/xVelocity));
        c = 0; // number of pixels traversed
        dx = 0;
        dy = 0;
        
        // track diagonal motion until collision
        if (is_vertical) {
            while (!place_meeting(x + sign(xVelocity)*floor(c*slope),
                                  y + c*sign(yVelocity), colliderID) &&
                   c < abs(yVelocity)) {
                c++;
            }
            c--;
            dx = sign(xVelocity)*floor(c*slope);
            dy = c*sign(yVelocity);
        } else {
            while (!place_meeting(x + c*sign(xVelocity),
                                  y + sign(yVelocity)*floor(c*slope), colliderID) &&
                   c < abs(xVelocity)) {
                c++;
            }
            c--;
            dx = c*sign(xVelocity);
            dy = sign(yVelocity)*floor(c*slope);
        }
        
        // move as far in x and y as you can--at most one of these loops should actually move the player
        while (!place_meeting(x + dx + sign(xVelocity), y + dy, colliderID) &&
               abs(dx) < abs(xVelocity)) {
            dx += sign(xVelocity);
        }
        while (!place_meeting(x + dx, y + dy + sign(yVelocity), colliderID) &&
               abs(dy) < abs(yVelocity)) {
            dy += sign(yVelocity);
        }
        
        if (abs(dx) < abs(xVelocity))
            xVelocity = 0;
        if (abs(dy) < abs(yVelocity))
            yVelocity = 0;
        
        x += dx;
        y += dy;
    } else {
        x += xVelocity;
        y += yVelocity;
    }
}
