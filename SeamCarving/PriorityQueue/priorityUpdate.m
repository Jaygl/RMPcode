function [pq] = priorityUpdate(pq, key, newValue)

if ~isempty(pq)
    %Find index in pq of key
    idx = find([pq.key] == key);
    if ~isempty(idx)
    	%If it was found, update it
    	pq(idx).cost = newValue;
    else
    	warning('Did not find key in pq')
    end
end