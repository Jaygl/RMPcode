function [ output_args ] = priority_test()
%PRIORITY_TEST Useful for checking the accuracy of our priority queue.
%Generates a vector v of 20 random numbers, used as the cost, and inserts
%them into the priority queue. We then MinPop all elements and compare the
%order they were removed with the sorted values of v (they should be the
%same!)
letters = 'abcdefghijklmnopqrstuvwxyz';
v = randi([1 10], 20, 1);

pq = priorityPrepare();

for k = 1:length(v)
    pq = priorityPush(pq, letters(k), v(k));
end

for k = 1:length(pq)
    [pq keys(k) v2(k)] = priorityMinPop(pq);
end

[sort(v) v2']

    
