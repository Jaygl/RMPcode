function [  ] = twolink_animatePath( theta1Path, theta2Path, fps )
%TWOLINK_ANIMATEPATH Summary of this function goes here
%   Detailed explanation goes here

for k = 1:length(theta1Path)
    twolinkDraw(theta1Path(k), theta2Path(k), 'r');
    hold on
    pause(1/fps)
end

