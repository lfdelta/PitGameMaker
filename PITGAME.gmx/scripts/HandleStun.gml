/// HandleStun(objID)
// While an object's stunCounter is less than its stunFrames,
// increment the counter and do nothing. When the counter equals
// stunFrames, set both to zero and resume other behavior.

with (objID) {
    stunCounter++;
    if (stunCounter >= stunFrames) {
        stunCounter = 0;
        stunFrames = 0;
    }
}
