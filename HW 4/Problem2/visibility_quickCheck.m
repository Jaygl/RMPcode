function [ flag ] = visibility_quickCheck( world, xStart, xGoal )
%VISIBILITY_QUICKCHECK This is a quick visibility check to determine if
%there is an unobstructed path between xStart and xGoal. We do this because
%the visibility of xStart and xGoal to the environment world are each 
%computed separately, but they never compare to each other.

%Not a truly complete function, does not give a shorter path if either
%xStart or xGoal is on a polygon

flag = 0;
%Check if either point is on a polygon
for k = 1:length(world.vertices)
    temp = world.vertices{k};
    % Determine if x is a point on the polygons
    mask = mean(ismember(temp, xStart),1);
    mask2 = mean(ismember(temp, xGoal), 1);
    idx = find(mask == 1);
    idx2 = find(mask2 == 1);
    if ~isempty(idx) || ~isempty(idx2)
        %if on the polygon, return
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
%A path exists if neither is on any of the polygons and there are no collisions
if collisions == 0
    flag = 1;
end

end

