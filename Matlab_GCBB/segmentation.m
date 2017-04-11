%-------------------------------------------------------
% University of Zaragoza
% Centro Politecnico Superior
% Robotics and Real Time Group
% Authors:  J. Neira, J. Tardos
% Date   :  7-2002
%-------------------------------------------------------
% File   :  relocation.m
%
% solve the vehicle relocation problem
%-------------------------------------------------------
clear all;
addpath('./tools');

% Stochastic map without vehicle, with the following structure:
%
% features:
%               n: 145
%               x: [290x1 double]
%               P: [290x290 double]
%          radius: [145x1 double]
%      var_radius: [145x1 double]
%    covisibility: [145x145 double]
%
load 'data/features';  

% Vehicle data, with the following structure:
%
% vehicle:
%
%      ground: [1x2000 struct]
%    odometry: [1x2000 struct]
%      motion: [1x1999 struct]
%
% vehicle.ground(1):
%
%    x: [3x1 double]
%    P: [3x3 double]
%
global vehicle;
load 'data/vehicle';

% SICK scans: [2000x361 double]
%
load 'data/sick';

% values for the chi squared distrib. at alpha = 0.05
%
% chi2(n) = chi squared function value for n d.o.f.
% chi2 = chi2inv(0.95,1:100)
%
global chi2;              
load 'data/chi2';         

for step = 1 : 2000,
% obtain observations
scan = sick(step,:);
obs(step) = find_trees (scan);
end