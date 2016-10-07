function [PQ,key,cost] = priorityMinPop(pq)
% This function accepts a vector pq that has structs with fields key and
% cost. It then finds the minimum cost and outputs the minimum cost and its
% corresponding "key". Finally, it removes that "key" and cost from the
% vector pq and outputs pq.

% Assign cost to a vector to calculate the minimum
for i = 1:length(pq)
    v(i) = pq(i).cost;
end

% Loop through the cost vector just created and for each value check if it
% is the minimum. Also match the minimum cost with its associated key.
for k = 1:length(pq)
    if v(k) == min(v)
        key = pq(k).key;
        cost = pq(k).cost;
        index = k;
    end
end

% Remove minimum cost and associated key element from fields in pq.

% If 1st element is min, assign rest of elements in order to new pq vector
if index == 1 
    for j = 2:length(pq)
    PQ(j-1).key = pq(j).key;
    PQ(j-1).cost = pq(j).cost;
    end
    
% If last element is min, assign all prior elements to new pq vector
elseif index == length(pq)
    for j = 1:length(pq)-1
    PQ(j).key = pq(j).key;
    PQ(j).cost = pq(j).cost;
    end
    
% If min cost is somewhere in between 1st and last elements, skip the
% element where it is the min
else
    for j = 1:index-1
        PQ(j).key = pq(j).key;
        PQ(j).cost = pq(j).cost;
    end
    for h = index+1:length(pq)
        PQ(h-1).key = pq(h).key;
        PQ(h-1).cost = pq(h).cost;
    end
end

end