%Remove all elements from the queue that have cost above some threshold
%%Inputs
%   pq          Priority queue struct array
%   threshold   Threshold for cost
function [pq] = priorityRemoveAbove(pq,threshold)
%obtain indicator of what elements to remove
flagRemove=[pq.cost]>threshold;
%remove them all at once
pq(flagRemove)=[];
