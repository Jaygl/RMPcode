function [ pq2, key, cost ] = priorityMinPop( pq )
%PRIORITYMINPOP Pops the minimum cost entry out of pq and returns the key
%and cost of that entry, along with the remainder of pq.
%   pq must be a priority queue

if length(pq) == 0
    key = [];
    cost = [];
    pq2 = priorityPrepare()
elseif length(pq) == 1
    key = pq(1).key;
    cost = pq(1).cost;
    pq2 = priorityPrepare();
else
    key = pq(1).key;
    cost = pq(1).cost;
    pq2 = pq(2:end);   

end

