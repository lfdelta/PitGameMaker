///DrawButton(xc, yc, width, height, fillClr, outlineClr, textClr, str)

xc = argument0;
yc = argument1;
width = argument2;
height = argument3;
fillClr = argument4;
outlineClr = argument5;
textClr = argument6;
str = argument7;

draw_set_colour(fillClr);
draw_rectangle(xc - width/2, yc - height/2, xc + width/2, yc + height/2, false);

draw_set_colour(outlineClr);
draw_rectangle(xc - width/2, yc - height/2, xc + width/2, yc + height/2, true);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_colour(textClr);
draw_text(x, y, str);
