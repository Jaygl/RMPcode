function [ flag ] = visibility_quickCheck( world, xStart, xGoal )
%VISIBILITY_QUICKCHECK Summary of this function goes here
%   Detailed explanation goes here

%Not a truly complete function, does not give a shorter path if either
%xStart or xGoal is on a polygon

flag = 0;
%Check for on polygon.
for k = 1:length(world.vertices)
    temp = world.vertices{k};
    % Determine if x is a point on the polygons
    mask = mean(ismember(temp, xStart),1);
    mask2 = mean(ismember(temp, xGoal), 1);
    idx = find(mask == 1);
    idx2 = find(mask2 == 1);
    if ~isempty(idx) || ~isempty(idx2)
        return;
    end
end

collisions = 0;
for l = 1:length(world.vertices)
    for m = 1:length(world.indeces{l})-1
        collisions = collisions + edge_checkCollision([xStart xGoal], ...
            [world.vertices{l}(:,m) world.vertices{l}(:,m+1)]);
    end
    collisions = collisions + edge_checkCollision([xStart xGoal], ...
        [world.vertices{l}(:,m+1) world.vertices{l}(:,1)]);
end
%Add vertex to list if no collisions
if collisions == 0
    flag = 1;
end

end

