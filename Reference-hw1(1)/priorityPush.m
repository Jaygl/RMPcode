function [pq] = priorityPush(pq,key,cost)
% This function adds a structure with arguments key and cost to their 
% corresponding fields in vector pq.
for i = 1:length(key)
    pq(i).key = key(i);
    pq(i).cost = cost(i);
end
end