function [check] = priorityTest(v)
% This function takes a randomly generated vector of length 20 and pushes
% it through a priority, then sorts it and extracts the sorted vector in
% order to compare with the built-in Matlab "sort" function.

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
for j = 1:19
[pq,key,cost(j)] = priorityMinPop(pq);
% The cost variable is built from min to max by looping through the
% priorityMinPop function multiple times. After doing the 1st 19 values,
% add the max of vector "v" to the end and this vector matches sort(v),
% which is Matlab's built-in function that sorts a vector from min to max
end

% Compare the 2: built-in matlab "sort" function vs priorityMinPop function
Matlab_func = sort(v);
priority_func = [cost(1,:)';max(v)];

% Check to see that the vectors match -> all columns = 0
for i = 1:20
check(i) = Matlab_func(i) - priority_func(i);
end
end