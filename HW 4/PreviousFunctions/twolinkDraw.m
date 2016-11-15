function [  ] = twolinkDraw( theta1, theta2, color )
%TWOLINKDRAW Draws the 2 link manipulator, with coordinates theta1 and
%theta2, in the provided color 'color'. The manipulator position is
%determined by the previous function twolinkKinematicMap(theta1, theta2)
%and we use an updated version of triangleDraw for the plotting.
%   color must be a string which represents a valid color set. Technically
%   we can also pass a line argument for how to draw it. EX: color = 'k--'
%   would plot the manipulator in black with a dashed line, instead of
%   solid.

%Find the positions of the 2 arms
vertices = twolinkKinematicMap(theta1, theta2);

%Draw the first arm
triangleDraw(vertices(:,1:3), color);
hold on
%Draw the second arm
triangleDraw(vertices(:,4:6), color);
xlim([-12 12])
ylim([-12 12])
axis square

end

