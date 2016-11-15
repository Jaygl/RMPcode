%Add an element to the priority queue
%function [pq] = priorityPush(pq,key,cost)
%Inputs
%   pq   Priority queue struct array
%   key  Key of the element to add
%   cost Cost associated to the element to add
%In this implementation the elment is added at the end.
function [pq] = priorityPush(pq,key,cost)
% This function adds a structure with arguments key and cost to their 
% corresponding fields in vector pq.
l=length(pq);
pq(l+1).key = key;
pq(l+1).cost = cost;
end