function [val] = fan(xstart, ystart, val, dist)
	val(xstart, ystart) = dist;
	
    %Prop left
	if xstart > 1 && val(xstart - 1, ystart) ~= inf 
		if isnan(val(xstart-1, ystart)) || val(xstart-1, ystart) > dist+1
            val = fan(xstart-1, ystart, val, dist+1);
        end
    end
    %Prop right
    if xstart < size(val,2) && val(xstart + 1, ystart) ~= inf
		if isnan(val(xstart+1, ystart)) || val(xstart+1, ystart) > dist+1
            val = fan(xstart+1, ystart, val, dist+1);
        end
    end
    %Prop up
    if ystart < size(val,1) && val(xstart, ystart+1) ~= inf
		if isnan(val(xstart, ystart+1)) || val(xstart, ystart+1) > dist+1
            val = fan(xstart, ystart+1, val, dist+1);
        end
    end
    %Prop down
    if ystart > 1 && val(xstart, ystart-1) ~= inf
		if isnan(val(xstart, ystart-1)) || val(xstart, ystart-1) > dist+1
            val = fan(xstart, ystart-1, val, dist+1);
        end
    end
end