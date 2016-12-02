function [ h ] = heuristic( graphVector, idxX, idxGoal )
%HEURISTIC The heuristic function for the graph_search function, which is
%just the euclidean distance between the two nodes with ideces idxX and
%idxGoal.
%   graphVector is a graphVector structure as previously defined
%   idxX is the index of the first node
%   idxGoal is the index of the second node.

%Calculate the distance between the two.
h = euc_dist(graphVector(idxX).x, graphVector(idxGoal).x);

end

