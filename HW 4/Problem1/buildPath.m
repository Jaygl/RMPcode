function [ path ] = buildPath( graphVector,idxStart,idxEnd )
%BUILDPATH Returns a list of indeces path that details how to
%travel from graphVector(idxEnd) to graphVector(idxStart)
%	graphVector is a graphVector structure detailed previously
%   idxStart is the index of graphVector that we intend to start at
%	idxEnd is the index of the graphVector that we intend to end at
idx = idxEnd;
path = [idx];
while idx ~= idxStart
    idx = graphVector(idx).backpointer;
    path(end+1) = idx;
end

end

