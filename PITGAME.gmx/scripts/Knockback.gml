///Knockback(objID, dmg, xvel, yvel, stun)

// Deals damage to the given object
// Sets the object's x and y velocities to instantiate a knockback effect
// Sets the object's state to STUN (defined as 0) for given number of stun frames
// Resets object's invincibility timer

{
    objID = argument0;
    dmg = argument1;
    xvel = argument2;
    yvel = argument3;
    stun = argument4;
    
    objID.hp -= dmg;
    objID.isInvincible = 1;
    objID.stunFrames = stun;
    
    objID.xVelocity = xvel;
    objID.yVelocity = yvel;
}
