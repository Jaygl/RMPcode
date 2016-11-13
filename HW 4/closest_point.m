function [idx] = closest_point(val, vec)

[c idx] = min(abs(vec-val));
