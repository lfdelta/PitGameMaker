///PointTo(target_x, target_y)

target_x = argument0;
target_y = argument1;

arm_x = obj_player_arm.x;// + obj_player_arm.arm_orig_x;
arm_y = obj_player_arm.y;// + obj_player_arm.arm_orig_y;
offset = obj_player_arm.theta_offset;


dir = sign(target_x - arm_x);
if (dir == 0)
   dir = 1;
obj_player_arm.image_xscale = dir * abs(obj_player_arm.image_xscale);
theta = darctan2(-(target_y - arm_y), dir*(target_x - arm_x));
obj_player_arm.image_angle = dir*(theta + offset);

