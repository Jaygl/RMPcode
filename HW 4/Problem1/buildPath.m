function [ path ] = buildPath( graphVector,idxStart,idxEnd )
%BUILDPATH Returns a list of indeces path that details how to
%travel from graphVector(idxStart) to graphVector(idxEnd)
%	graphVector is a graphVector structure detailed previously
%   idxStart is the index of graphVector that we intend to start at
%	idxEnd is the index of the graphVector that we intend to end at
idx = idxEnd;
path = [idx];
%Follow the backpointers until we reach start location
while idx ~= idxStart
    idx = graphVector(idx).backpointer;
    path(end+1) = idx;
end
%This path is currently going from end -> start, so flip it
path = fliplr(path);
end

