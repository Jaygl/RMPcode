function [val] = wavefront_propogate(val)
	[i j] = find(val == 0)
	val = fan(i,j,val, 0);
end
