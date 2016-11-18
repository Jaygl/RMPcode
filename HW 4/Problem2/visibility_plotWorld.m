function [  ] = visibility_plotWorld( world )
%VISIBILITY_PLOTWORLD plots the polygons in object world
%World is a world structure as peviously defined.

%For each polygon
for k = 1:length(world.vertices)
	%draw that polygon
    polygon_draw(world.vertices{k});
    hold on
end
axis square
end

