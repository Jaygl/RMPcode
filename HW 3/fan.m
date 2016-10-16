function [val] = fan(xstart, ystart, val, dist)
	val(xstart, ystart) = dist;
	
	if xstart > 1 && val(xstart - 1, ystart) ~= inf  
			val = fan(xstart-1, ystart, val, dist+1);
	end
	if xst