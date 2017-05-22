// Draw at rounded coordinates, then return to old non-rounded value
xDraw = x;
yDraw = y;
x = round(x);
y = round(y);
draw_self();
x = xDraw;
y = yDraw;
