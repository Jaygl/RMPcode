%Remove key with minimum cost from the queue
%function flag=priority_isMember(pq,key)
%Inputs
%   pq  Priority queue struct array
%   key Key to find
%Outputs
%   pq   Updated priority queue struct array
%   key  Key of element with minimum cost
%   cost Minimum cost
function [pq,key,cost]=priorityMinPop(pq)
if isempty(pq)
    key=[];
    cost=[];
else
    %Put all costs into a vector, and find minimum
    [cost,idx]=min([pq.cost]);
    %Get the key of the minimum
    key=pq(idx).key;
    %Remove minumum element from the queue
    pq(idx)=[];
end

