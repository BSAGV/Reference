function ok = unary (i, j, features, observations)
%-------------------------------------------------------
% University of Zaragoza
% Centro Politecnico Superior
% Robotics and Real Time Group
% Authors:  J. Neira, J. Tardos
% Date   :  7-2002
%-------------------------------------------------------
% function ok = unary (i, j, features, observations)
%
% Deterime whether observation i and feature j satisfy
% unary constraints (the trunk radii of the corresponding
% trees are stochastically compatible).
%-------------------------------------------------------
global chi2;
 indices1 = point_rows (i);
 indices2 = point_rows (j);
if (j == 0) % Null pairing
    ok = 1;
else
    x = features.radius(j)-observations.radius(i);
    P = features.var_radius(j);%+observations.var_radius(i);
    d = x^2 / P;
    ok = d <= chi2(1);
end
