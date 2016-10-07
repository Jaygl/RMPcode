function [] = triangleDraw(vertices, color)
%Draws a triangle in the current figure. Does not overwrite pre-existing
%data in the figure

%vertices is a 2x3 array for x,y pairs.

hold on
plot([vertices(1,:) vertices(1,1)], [vertices(2,:) vertices(2,1)], color)

end

