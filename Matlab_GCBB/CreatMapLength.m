function CreatMapLength(features)

global MapLength;
for i=1:features.n
    for j=1:features.n
        if i==j
            continue;
        end
        indices = point_rows ([i j]);
          x = features.x(indices);
          P = features.P(indices,indices);
         [d2, v2] = estimate_distance (x, P);
         MapLength.length(i,j)=d2;
         MapLength.var(i,j)=v2;
    end
end
