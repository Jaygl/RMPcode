function [idxVisibleVertices] = visibility_check(world, x)
%Checks visibility between point x and every vertex within world, returns
%the list of indices of vertices which are visible from x
%   world is a world structure defined previously
%   x is a 2x1 vector containing the point (x,y)
idxVisibleVertices = [];
polyflag = 0;
%Need to determine if x is on one of the polygons or in free space
for k = 1:length(world.vertices)
    temp = world.vertices{k};
    
    % Determine if x is a point on the polygons
    mask = mean(ismember(temp, x),1);
    idx = find(mask == 1);
    
    if ~isempty(idx)
        %on the polygon, need to check self occlusion. Need to wrap
        %indeces if the it is one of the ends.
        if idx == 1
            prevVertex = world.vertices{k}(:,length(world.indeces{k}));
            nextVertex = world.vertices{k}(:,idx+1);
        elseif idx == length(world.indeces{k})
            prevVertex = world.vertices{k}(:,idx-1);
            nextVertex = world.vertices{k}(:,1);
        else
            prevVertex = world.vertices{k}(:,idx-1);
            nextVertex = world.vertices{k}(:,idx+1);
        end
        polyflag = 1;
        isboundary = ispolycw(temp(1,:), temp(2,:));
        break;
    end
end

for k = 1:length(world.vertices)
    %Check visibility to each vertex of each polygon
    temp = world.vertices{k};
    
    for j = 1:length(world.indeces{k})
        idx = world.indeces{k}(j);
        x_y_target = temp(:,j);
        SOC = false;
        
        if polyflag
            %Check self occlusion first
            if isboundary
                %Boundary
%                 SOC = min([~visibility_checkSelfOcclusion(x, prevVertex, nextVertex, x_y_target)...
%                     visibility_checkSelfOcclusion(x, nextVertex, prevVertex, x_y_target)]);
            else
                %Obstacle
                SOC = visibility_checkSelfOcclusion(x, prevVertex, nextVertex, x_y_target);
            end
        end
        
        if ~SOC
            %If not self occluded, then check for edge intersection.
            %If it is self occluded, then we do not bother checking edges.
            collisions = 0;
            %Check the number of collisions with edges a line from x to 
            %x_y_target has
            for l = 1:length(world.vertices)
                for m = 1:length(world.indeces{l})-1
                    collisions = collisions + edge_checkCollision([x x_y_target], ...
                        [world.vertices{l}(:,m) world.vertices{l}(:,m+1)]);
                end
                collisions = collisions + edge_checkCollision([x x_y_target], ...
                    [world.vertices{l}(:,m+1) world.vertices{l}(:,1)]);
            end
            %Add vertex to list if no collisions
            if collisions == 0
                idxVisibleVertices = [idxVisibleVertices world.indeces{k}(j)];
            end
        end
    end
end