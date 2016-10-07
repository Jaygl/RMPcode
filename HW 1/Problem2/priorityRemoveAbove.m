function [ pq2 ] = priorityRemoveAbove( pq, threshold )
%PRIORITYREMOVEABOVE Removes all elements in pq with a cost greater than
%the threshold value
%   Detailed explanation goes here

n = length(pq);

for k = 1:n
    if pq(n+1-k).cost <= threshold
        pq2 = pq(1:n+1-k);
        return
    end
end

pq2 = priorityPrepare();

end

