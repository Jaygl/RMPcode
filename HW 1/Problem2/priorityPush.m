function [ pq ] = priorityPush( pq, key, cost )
%priorityPush adds an element to the priority queue pq pq.key = key and
%pq.cost = cost.
%   pq must be an existing priority queue, NO ERROR CHECKING PRESENT
%   key is (usually) a string naming the entry
%   cost is a real-valued number

if isempty(pq)
    pq(1).key = key;
    pq(1).cost = cost;
else
    for k = 1:length(pq)
        if cost < pq(k).cost
            %Insert above
            pq(k+1:end+1) = pq(k:end);
            pq(k).cost = cost; pq(k).key = key;            
            return;
        end
    end
    
    pq(k+1).cost = cost; pq(k+1).key = key;
end
    
    
end

