function [  ] = visibility_plotWorld( world )
%VISIBILITY_PLOTWORLD Summary of this function goes here
%   Detailed explanation goes here

for k = 1:length(world.vertices)
    polygon_draw(world.vertices{k});
    hold on
end
axis square
end

