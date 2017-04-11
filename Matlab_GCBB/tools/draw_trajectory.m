function draw_trajectory (trajectory, color)
%-------------------------------------------------------
% University of Zaragoza
% Centro Politecnico Superior
% Robotics and Real Time Group
% Authors:  J. Neira, J. Tardos
% Date   :  5-2004
%-------------------------------------------------------
% function draw_trajectory (trajectory, color)
%
% Draws a line connecting all locations in trajectory.x
%-------------------------------------------------------

l = [trajectory.x];
x = l(1:3:end);
y = l(2:3:end);
plot(x,y,['-' color]);