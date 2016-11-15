function [closest_val] = closest_point(val, vec)

[c idx] = min(abs(vec-val));
closest_val = vec(idx);