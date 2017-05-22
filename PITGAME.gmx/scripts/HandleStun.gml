if (isInvincible) {
    iCounter++;
    if (iCounter >= iFrames) {
        iCounter = 0;
        isInvincible = 0;
    }
}
if (stunFrames > 0) {
    FSMstate = 0; // FSM.STUN, by convention
}
