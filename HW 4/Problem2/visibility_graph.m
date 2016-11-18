function [ graphVector ] = visibility_graph( world )
%VISIBILITY_GRAPH creates a graphVector structure based on the visibility
%in world. Each vertex in world is an entry and is linked to all other nodes
%which have LOS to one another. The indeces of graphVector relate to the index
%in world.indeces
%   world is a world structure as previously defined.

%Populate all the fields of graphVector except neighborCost.
for k = 1:length(world.indeces)
    for j = 1:length(world.indeces{k})
        idx = world.indeces{k}(j);
        graphVector(idx).x = world.vertices{k}(:,j);
        neighbors = visibility_check(world, graphVector(idx).x);
        neighbors(find(neighbors == idx)) = [];
        graphVector(idx).neighbors = neighbors;
        graphVector(idx).g = [];
        graphVector(idx).backpointer = [];
    end
end
%Now that all graphVector.x's are assigned, calculate neighborCost
%and update graphVector
for k = 1:length(graphVector)
    for j = 1:length(graphVector(k).neighbors)
        neighbor = graphVector(k).neighbors(j);
        graphVector(k).neighborsCost(j) = euc_dist(graphVector(k).x, ...
            graphVector(neighbor).x);
    end
end
        

