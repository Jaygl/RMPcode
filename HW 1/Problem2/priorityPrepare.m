function [pq] = priorityPrepare()
%PRIORITYPREPARE initializes an empty priority queue with fields key and cost

pq = repmat(struct('key', [], 'cost', []), 0);

end

