function [ final_route ] = path2delete( graphVector, route )
%PATH2DELETE Summary of this function goes here
%   Detailed explanation goes here
[xvec] = [graphVector(route).x];
y = xvec(2,:);
final_route = zeros(1,y(end-1));
final_route(1) = [route(2)];
y_prev = y(2);
pos = 2;

for k = 3:length(y)-1
    if y(k) ~= y_prev
        final_route(pos) = route(k);
        y_prev = y(k);
        pos = pos + 1;
    end
end

end

