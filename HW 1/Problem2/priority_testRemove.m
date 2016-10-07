function [ output_args ] = priority_testRemove()
%PRIORITY_TESTREMOVE Another function for testing our priority queue.
%Generates a vector v of 20 random numbers, used as the cost, and inserts
%them into the priority queue. We then MinPop the first 5 elements (which
%removes the 5 lowest values for cost) and then RemoveAbove based on the
%threshold value (here set to 5).

threshold = 5
letters = 'abcdefghijklmnopqrstuvwxyz';
v = randi([1 10], 20, 1);

pq = priorityPrepare();

for k = 1:length(v)
    pq = priorityPush(pq, letters(k), v(k));
end

for k = 1:5
    [pq keys(k) v2(k)] = priorityMinPop(pq);
end
display('Sorted cost values')
sort(v)
display('First 5 "MinPop" operations')
v2
display(['Now removing all above ' num2str(threshold)])
pq = priorityRemoveAbove(pq, threshold)
pq.cost

end

