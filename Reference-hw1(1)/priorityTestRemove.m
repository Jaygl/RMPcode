function [pq,PQ,v] = priorityTestRemove()
% This function takes a randomly generated vector of length 20 and pushes
% it through a priorityqueue, then sorts it and extracts the sorted vector.
% After extracting the first 5 elements of the sorted vector, it calls
% "priorityRemoveAbove" in order to filter out any elements in the
% remaining vector that are above a specified threshold.

% Clean up
clear all
clc

% First create pq by calling "priorityPrepare"
[pq] = priorityPrepare();

% Generate a vector of 20 random integers between 1 and 10
a = 1;
b = 10;
v = round(a + (b-a)*rand(20,1));

% Create key vector
key = ['a';'b';'c';'d';'e';'f';'g';'h';'i';'j';'k';'l';'m';'n';'o';'p';'q';'r';'s';'t'];

% Push randomly generated 20x1 vector into "priorityPush" to assign random
% values to "cost" field
[pq] = priorityPush(pq,key,v);

% Call "priorityMinPop" to determine the min of vector "v". Need to iterate
% through in order to get the min of each new population and reorder the
% vector from min to max

for j = 1:5 % only want the 1st 5 elements
[pq,key(j),cost(j)] = priorityMinPop(pq);
% The cost variable is built from min to max by looping through the
% priorityMinPop function multiple times.
end

% Now that the vector has been sorted and the 1st 5 elements are extracted,
% call "priorityRemoveAbove" function to filter out anything above 4:
threshold = 4;
for i = 1:5
p(i).key = key(i);
p(i).cost = cost(i);
end
[PQ] = priorityRemoveAbove(p,threshold);

end