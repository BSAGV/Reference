function ok = binary (H, i, j, features, observations)
%-------------------------------------------------------
% University of Zaragoza
% Centro Politecnico Superior
% Robotics and Real Time Group
% Authors:  J. Neira, J. Tardos
% Date   :  7-2002
%-------------------------------------------------------
% function ok = binary (H, i, j, features, observations)
%
% Validate binary constrainst between pairing (Ei, Fj)
% and all pairings in H
%-------------------------------------------------------
global chi2;
global MapLength;
global ObsLength;
ok = 1;
for k = 1:length(H),
    
    if H(k) % non null pairing?
        
        % Check whether pairing (E_i, F_j) with (E_k, F_H(k))
        % satisfiy binary constraints
        
%         indices = point_rows ([i k]);
%         z = observations.z(indices);
%         R = observations.R(indices,indices);
%         
%         [d1, v1] = estimate_distance (z, R);
        d1= ObsLength.length(i,k);
        v1= ObsLength.var(i,k);

%         indices = point_rows ([j H(k)]);
%         x = features.x(indices);
%         P = features.P(indices,indices);
%         
%         [d2, v2] = estimate_distance (x, P);
         d2 = MapLength.length(j,H(k)) ;
         v2 =  MapLength.var(j,H(k));

        d = (d1 - d2)^2 / (v1 + v2);
        ok = d <= chi2(1);
        
        if ~ok break; end
    end
    
end