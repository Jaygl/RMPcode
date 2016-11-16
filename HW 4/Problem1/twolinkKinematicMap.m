function [ vertices ] = twolinkKinematicMap( theta1, theta2 )
%TWOLINKKINEMATICMAP This function takes coordinates theta1 and theta2,
%which represent the angles of the manipulator arms, and performs the
%rotation of those arms. Per the problem description, theta is measured
%from the positive x axis counter-clockwise. Manipulator dimensions are
%seen in the problem.
%   vertices = [A_x B_x C_x; A_y B_y C_y]

%First rotation always starts from origin, so initial coordinates are
%vertices = [0 0 6; 1 -1 0] (This is aligning the manipulator with theta=0,
%which will then be rotated to our desired theta by the rotation matrix).
start_coords = [0 0 6; 1 -1 0];

%Define the two rotation matrices
R1 = [cos(theta1) -sin(theta1); sin(theta1) cos(theta1)];
R2 = [cos(theta2) -sin(theta2); sin(theta2) cos(theta2)];

%Rotate the first manipulator arm
man1 = R1*start_coords;

%Rotate the second manipulator arm. NOTE: We do this at the origin and then
%translate the arm to the end of arm1. If we did this in reverse
%order, the pivot point of the rotation would be the origin and not the
%connection between arm1 and arm2.
man2_centered = R2*start_coords;

%Translate the 2nd arm to the attachment point.
man2 = repmat(man1(:,3),1,3) + man2_centered;

%Concatenate the coordinates of manipulators 1 and 2 to get vertices.
vertices = [man1 man2];

end

