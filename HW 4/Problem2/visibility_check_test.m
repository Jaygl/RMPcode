function [  ] = visibility_check_test(  )
%VISIBILITY_CHECK_TEST Summary of this function goes here
%   Detailed explanation goes here
load('polygonalWorld')
visibility_plotWorld(world)

% x = 4*(rand(2,1)-.5)
% x = world.vertices{2}(:,1);
% x = world.vertices{2}(:,4);
x = world.vertices{3}(:,4);
x = world.vertices{1}(:,2);
x = world.vertices{1}(:,6);
x = xStart(:,3);
x = xGoal;

plot(x(1),x(2),'bo')
indeces = visibility_check(world, x)
for k = 1:length(indeces)
    %find the vertex with index indeces(k)
    for j = 1:length(world.vertices)
        idx_vec = world.indeces{j};
        target = find(idx_vec == indeces(k));
        if ~isempty(target)
            plot([x(1) world.vertices{j}(1,target)], ...
                [x(2) world.vertices{j}(2,target)], 'r','linewidth',2);
        end
    end
end