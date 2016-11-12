function [ path ] = buildPath( graphVector,idxStart,idxEnd )
%BUILDPATH Summary of this function goes here
%   Detailed explanation goes here
idx = idxEnd;
path = [idx];
while idx ~= idxStart
    idx = graphVector(idx).backpointer;
    path(end+1) = idx;
end

end

