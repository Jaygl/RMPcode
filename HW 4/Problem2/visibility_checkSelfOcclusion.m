function [flag] = visibility_checkSelfOcclusion(vertex,vertexPrev,vertexNext,x)
%VISIBILITY_CHECKSELFOCCLUSION Summary of this function goes here
%   Detailed explanation goes here

flag = false;

%vertex -> x
myvec = x-vertex;
%vertex -> vertexPrev
prevVec = vertexPrev-vertex;
%vertex -> vertexNext
nextVec = vertexNext-vertex;

if sum(sign(cross(myvec,nextVec)) == sign(cross(nextVec,myvec))) == 3
	%Then the line of sight is between the 2
	flag = true;
end

end

