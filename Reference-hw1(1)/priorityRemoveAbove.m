function [PQ] = priorityRemoveAbove(pq,threshold)
% This function takes a vector pq (that has structs with fields key and
% cost) and checks each cost to determine if it is above a particular
% threshold. The function removes all costs and associated keys above the
% input threshold and outputs the new pq vector with the values above
% removed.

c = 0;
for i = 1:length(pq) % go through each cost element one-by-one
    if pq(i).cost <= threshold % check if it's less than the threshold
% if the cost of the ith element is below or equal to the threshold then
% add it to the new pq vector to be outputted. also add associated key
    PQ(c+1).cost = pq(i).cost;
    PQ(c+1).key = pq(i).key;
    
% This is a counter used to increment the new pq vector   
    c = c + 1;
    end
end