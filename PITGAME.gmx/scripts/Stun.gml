/// Stun(objID, stunFrames)

objID = argument0;
stun = argument1;

with (objID) {
    if (stunCounter >= stunFrames) {
        stunCounter = 0;
        isStunned = 0;
    }
    objID.stunCounter++;
}
