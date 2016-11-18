function [dist] = euc_dist(v1, v2)
%Returns the euclidean distance between 2 points v1 and v2
%	v1, v2 are 2x1 vectors holding x,y coordinate pairs
	dist = sqrt((v1(1)-v2(1))^2+(v1(2)-v2(2))^2);
end