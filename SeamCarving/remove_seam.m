function [im2] = remove_seam( im, route )
%REMOVE_SEAM Summary of this function goes here
%   Detailed explanation goes here
im2 = im;
z = size(im);
%Step through each row and shift it left
for k = 1:length(route)
    %Find the subscripts
    [r c] = ind2sub(z(1:2), route(k));
    im2(r, c:end-1, :) = im(r, c+1:end, :);
end
im2(:,z(2),:) = [];
end

