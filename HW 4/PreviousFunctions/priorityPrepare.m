%Prepare an empty priority queue
%function [pq] = priorityPrepare()
function [pq] = priorityPrepare()
pq = repmat(struct('key',[],'cost',[]),0,1);
end