
xVelocity = 0;
yVelocity = 0;

pauseKey = max(keyboard_check(vk_enter), keyboard_check(vk_escape));
if (pauseKey) room_goto(Menu);
