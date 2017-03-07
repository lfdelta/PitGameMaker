/// RaycastToPoint(x1,y1,x2,y2,object,prec,notme)
//
//  Returns the instance id of an object colliding with a given line and
//  closest to the first point, or noone if no instance found.
//  The solution is found in log2(range) collision checks.
//
//      x1,y2       first point on collision line, real
//      x2,y2       second point on collision line, real
//      object      which objects to look for (or all), real
//      prec        if true, use precise collision checking, bool
//      notme       if true, ignore the calling instance, bool
{
    var ox,oy,dx,dy,object,prec,notme,sx,sy,inst,i;
    ox = argument0;
    oy = argument1;
    dx = argument2;
    dy = argument3;
    object = argument4;
    prec = argument5;
    notme = argument6;
    sx = dx - ox;
    sy = dy - oy;
    acc[0] = undefined;
    acc[1] = undefined;
    
    if (collision_line(ox,oy,dx,dy,object,prec,notme)) {
        while ((abs(sx) >= 0.5) || (abs(sy) >= 0.5)) {
            sx /= 2;
            sy /= 2;
            if (collision_line(ox,oy,dx,dy,object,prec,notme)) {
                dx -= sx;
                dy -= sy;
                acc[0] = dx;
                acc[1] = dy;
            } else {
                dx += sx;
                dy += sy;
            }
        }
    }
    return acc;
}
