function [dist] = euc_dist(v1, v2)
	dist = sqrt((v1(1)-v2(1))^2+(v1(2)-v2(2))^2);
end