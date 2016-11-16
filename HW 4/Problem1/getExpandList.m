function [ idxExpand ] = getExpandList( graphVector, idxNBest, C )
%GETEXPANDLIST Summary of this function goes here
%   Detailed explanation goes here

neighborlist = graphVector(idxNBest).neighbors;
not_visited = ~ismember(neighborlist, C);
idxExpand = neighborlist(not_visited);

end

