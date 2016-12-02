function [  ] = twolink_animatePath( theta1Path, theta2Path, fps )
% TWOLINK_ANIMATEPATH Draws the configurations of the twolink manipulator as
% it moves along the path defined by theta1Path and theta2Path. The draw
% speed will be done at fps frames per second.
%   theta1Path is a vector of length N containing the theta1 angles
%   theta2Path is a vector of length N containing the theta1 angles
%   fps is the number of frames per second to be drawn

for k = 1:length(theta1Path)
    twolinkDraw(theta1Path(k), theta2Path(k), 'r');
    hold on
    pause(1/fps)
end

