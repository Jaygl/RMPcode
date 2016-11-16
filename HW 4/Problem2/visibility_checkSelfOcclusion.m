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


theta1 = acos(dot(prevVec,myvec)/(norm(myvec)*norm(prevVec)));
theta2 = acos(dot(nextVec,myvec)/(norm(myvec)*norm(nextVec)));
theta3 = acos(dot(nextVec,prevVec)/(norm(prevVec)*norm(nextVec)));
if abs(theta3 - theta2 - theta1) <= 1e-3
    flag = true;
end


end





% [theta1, ~] = cart2pol(prevVec(1), prevVec(2));
% if theta1 < 0
%     theta1 = theta1+2*pi;
% end
% [theta2, ~] = cart2pol(nextVec(1), nextVec(2));
% if theta2 < 0
%     theta2 = theta2+2*pi;
% end
% [thetaG, ~] = cart2pol(myvec(1), myvec(2));
% if thetaG < 0
%     thetaG = thetaG+2*pi;
% end
% [theta1 theta2 thetaG]
% 
% if theta1 < theta2
%     if (thetaG < theta1 && thetaG > 0) || (thetaG < 2*pi && thetaG > theta2)
%         flag = true;
%     end
% elseif thetaG < theta1 && thetaG > theta2
%     flag = true;
% end

% [theta1, ~] = cart2pol(prevVec(1), prevVec(2));
% [theta2, ~] = cart2pol(nextVec(1), nextVec(2));
% [thetagoal, ~] = cart2pol(myvec(1), myvec(2));
% % [theta1, ~] = cart2pol(nextVec(1), nextVec(2));
% if theta1 < 0
%     theta1 = 2*pi+theta1;
% end
% % [theta2, ~] = cart2pol(prevVec(1), prevVec(2));
% if theta2 < 0
%     theta2 = 2*pi+theta2;
% end
% 
% if theta2 > theta1
%     if (thetagoal < theta1 && thetagoal >= 0) || (thetagoal <= 2*pi && thetagoal > theta2)
%         flag = true;
%     end
% elseif thetagoal < theta1 && thetagoal > theta2
%     flag = true;
% end

% z1 = sign(cross([myvec; 0],[nextVec; 0]));
% z2 = sign(cross([myvec; 0],[prevVec; 0]));
% 
% if sign(z1(3)) == sign(z2(3))
%     flag = true;
% end

% if sum(sign(cross([myvec; 0],[nextVec; 0])) == sign(cross([prevVec; 0],[myvec; 0]))) == 3
% 	%Then the line of sight is between the 2
% 	flag = true;
% end