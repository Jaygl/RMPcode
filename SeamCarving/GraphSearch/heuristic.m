function [ dist ] = heuristic( graphVector, idxStart, idxGoal )
%HEURISTIC Summary of this function goes here
%   Detailed explanation goes here
startpos = graphVector(idxStart).x;
endpos = graphVector(idxGoal).x;

dist = abs(startpos(2)-endpos(2))+graphVector(idxStart).cost;

end

