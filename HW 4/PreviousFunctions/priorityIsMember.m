%Checks if a particular key is in the queue
%function flag=priorityIsMember(pq,key)
%Inputs
%   pq  Priority queue struct array
%   key Key to find
%Outputs
%   flag True if any one of the elements in pq has the key field equal
%        to the input key, otherwise returns false.
function flag=priorityIsMember(pq,key)
%Run isequal test on each element, and return true if any of these
%comparisons succeeds
flag=any(arrayfun(@(x) isequal(x.key,key),pq));
