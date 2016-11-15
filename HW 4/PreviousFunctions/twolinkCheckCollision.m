function [ flag ] = twolinkCheckCollision( theta1, theta2, points )
%TWOLINKCHECKCOLLISION Given the manipulator state variables theta1 and
%theta2, we check whether the manipulator has collided with an obstacle
%defined by points. Any overlap between the manipulator arms and the points
%in 'points' will result in a collision.
%   points is a 2xnpoints array, with point i having (x,y) coordinates
%   (points(1,i), points(2,i)).
%   Returns flag = 1 if there was a collision with any of the points, 
%   otherwise return a 0.

%Compute the positions of the 2 arms
vertices = twolinkKinematicMap(theta1, theta2);
%Check for collisions between arm1 and any of the points
man1_flags = triangleCheckCollision(points, vertices(:,1:3));
%Check for collisions between arm2 and any of the points
man2_flags = triangleCheckCollision(points, vertices(:,4:6));

%If there were any collisions, on either arm, return 1. Otherwise, return 0
if sum(man1_flags + man2_flags) == 0
    flag = 0;
else
    flag = 1;
end

end

