function [flag] = visibility_checkSelfOcclusion(vertex,vertexPrev,vertexNext,x)
%VISIBILITY_CHECKSELFOCCLUSION Determines if the visibility from vertex to
%x is blocked via self occlusion by the polygon vertex lies on
%vertex is a 2x1 vector containing the x,y pair of the vertex of interest
%vertexPrev is a 2x1 vector containing the x,y pair of the prev vertex on
%the polygon
%vertexNext is a 2x1 vector containing the x,y pair of the next vertex on
%the polygon
%x is a 2x1 vector containing the x,y pair to check visibility to.
flag = false;
if mean(x == vertexPrev) == 1 || mean(x == vertexNext) == 1
    return;
end
%vertex -> x
myvec = x-vertex;
%vertex -> vertexPrev
prevVec = vertexPrev-vertex;
%vertex -> vertexNext
nextVec = vertexNext-vertex;

%To determine if our target position is in between the two vectors
%that go from vertex->prevvertex and vertex->nextvertex we need to get
%the angles associated with each of the 3 combinations. This allows us to
%check if the angle from vertex->x is between the other 2. We allow a slight
%epsilon in the check to account for minor errors.
theta1 = acos(dot(prevVec,myvec)/(norm(myvec)*norm(prevVec)));
theta2 = acos(dot(nextVec,myvec)/(norm(myvec)*norm(nextVec)));
theta3 = acos(dot(nextVec,prevVec)/(norm(prevVec)*norm(nextVec)));
if abs(theta3 - theta2 - theta1) <= 1e-3
    flag = true;
end
end
