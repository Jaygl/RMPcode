function [ graphVector ] = visibility_graph( world )
%VISIBILITY_GRAPH Summary of this function goes here
%   Detailed explanation goes here


for k = 1:length(world.indeces)
    for j = 1:length(world.indeces{k})
        idx = world.indeces{k}(j);
        graphVector(idx).x = world.vertices{k}(:,j);
        neighbors = visibility_check(world, graphVector(idx).x);
        neighbors(find(neighbors == idx)) = [];
        graphVector(idx).neighbors = neighbors;
%         for m = 1:length(graphVector(idx).neighbors)
%             for l = 1:length(world.indeces)
%                 idx_list = world.indeces{l};
%                 target = find(idx_list == graphVector(idx).neighbors(m));
%                 if ~isempty(target)
%                     graphVector(k).neighborsCost(m) = euc_dist(graphVector(idx).x, ...
%                         world.vertices{l}(:,target));
%                 end
%             end
%         end
        graphVector(idx).g = [];
        graphVector(idx).backpointer = [];
    end
end

for k = 1:length(graphVector)
    for j = 1:length(graphVector(k).neighbors)
        neighbor = graphVector(k).neighbors(j);
        graphVector(k).neighborsCost(j) = euc_dist(graphVector(k).x, ...
            graphVector(neighbor).x);
    end
end
        

