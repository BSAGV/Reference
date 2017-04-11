function H = relocation_GCBB (features, observations)
%-------------------------------------------------------
% University of Zaragoza
% Centro Politecnico Superior
% Robotics and Real Time Group
% Authors:  J. Neira, J. Tardos
% Date   :  7-2002
%-------------------------------------------------------
% function H = relocation_GCBB (features, observations)
%
% obtain the pairing hypotesis between observations and
% features, according to the Geometric Constraints
% Branch and Bound algorithm.
%-------------------------------------------------------

% will hold the Best hypothesis according to GCBB
global Best;
Best=zeros(1, observations.m);

gcbb (features, observations, [], 1);
% silly answer
H = Best;
return

function gcbb (features, observations, H, i)
global Best;
global configuration;
if i > observations.m % leaf node?
    if pairings(H) > pairings(Best) % did better?
         % if jointly_compatible(prediction, observations, [H ])
              Best = H;
         % end
    end
else
    %individually_compatible = find(compatibility.ic(i,:));
    
    if(isempty(H))
        count=1:features.n;
    else
         count=covisible(H,features);
     end
    for j = count
        if   binary(H,i, j,features,observations) % & unary(i, j,features,observations) 
            gcbb(features, observations, [H j], i + 1); %pairing (Ei, Fj) accepted 
        end
    end
    if pairings(H) +  observations.m-i > pairings(Best) % can do better?
       gcbb(features, observations, [H 0], i + 1); % star node: Ei not paired
    end
end



%-------------------------------------------------------
function p = pairings(H)
% 
%-------------------------------------------------------
p = nnz(H);

function  p= covisible(H,features)
h=find(H);
[m n]=size(h);
temp=features.covisibility(h,:);
[a b]=size(temp);
zero1=zeros(1,b);
temp=[temp;zero1];
add1=sum(temp);
 p=find(add1==n);






