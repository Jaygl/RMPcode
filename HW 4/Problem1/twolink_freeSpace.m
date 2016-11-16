function [ theta1Grid, theta2Grid, flag ] = twolink_freeSpace( points,NGrid )
%TWOLINK_FREESPACE Summary of this function goes here
%   Detailed explanation goes here
theta1Grid = linspace(0,2*pi,NGrid);
theta2Grid = theta1Grid;
[theta1 theta2] = meshgrid(theta1Grid, theta2Grid);
flag = zeros(size(theta1));

for k = 1:numel(theta1)
    flag(k) = ~twolinkCheckCollision(theta1(k),theta2(k), points);
end

end
