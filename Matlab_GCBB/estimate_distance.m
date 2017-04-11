function [d, v] = estimate_distance (x, P),
%-------------------------------------------------------
% University of Zaragoza
% Centro Politecnico Superior
% Robotics and Real Time Group
% Authors:  J. Neira, J. Tardos
% Date   :  7-2002
%-------------------------------------------------------
% function [d, v] = estimate_distance (x, P)
%
% obtain an estimated value, and variance, of the
% euclidean distance between two points, whore
% cartesian coordinates are given in x, with
% covariance given in P.
%-------------------------------------------------------

x1 = x(1);
y1 = x(2);
x2 = x(3);
y2 = x(4);
d = sqrt((x1-x2)*(x1-x2)+(y1-y2)*(y1-y2));
dx=(x1-x2)/d;
dy=(y1-y2)/d;
%euclidean distance

dd=[dx dy -dx -dy];
v = dd*P*dd';
