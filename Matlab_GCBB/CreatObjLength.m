function CreatObjLength(observations)
global ObsLength;

for i=1:observations.m
    for j=1:observations.m
        if i==j
            continue;
        end
        indices = point_rows ([i j]);
        z = observations.z(indices);
        R = observations.R(indices,indices);        
        [d1, v1] = estimate_distance (z, R);            
         ObsLength.length(i,j)=d1;
         ObsLength.var(i,j)=v1;
    end
end