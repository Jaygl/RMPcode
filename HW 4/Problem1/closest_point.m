function [closest_val] = closest_point(val, vec)
%Simple function to find the closest value to val within
%the vector vec. Returns the closest_value
%	val is a scaler
%	vec is a 1xN vector of values (usually the NGrid vector)
[c idx] = min(abs(vec-val));
closest_val = vec(idx);