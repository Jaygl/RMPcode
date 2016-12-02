function [ idxExpand ] = getExpandList( graphVector, idxNBest, C )
%GETEXPANDLIST Returns the list of neighbors to node idxNBest in
%graphVector that are not already on the list of closed nodes C.
%   C is a vector of indeces of closed nodes, corresponding to graphVector
%   graphVector is a graphVector structure detailed previously
%   idxNBest is the index of the node whos neighbors are being checked,
%       (scaler-valued)

%Get the list of neighbors
neighborlist = graphVector(idxNBest).neighbors;
%Determine which neighbors have not been visited (are not in C)
not_visited = ~ismember(neighborlist, C);
%Return only the neighbors who are not on C.
idxExpand = neighborlist(not_visited);

end

