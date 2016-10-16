function [] = fan2(xstart, ystart, dist)
	global VAL;
    VAL(xstart, ystart) = dist;
	
    %Prop left
	if xstart > 1 && VAL(xstart - 1, ystart) ~= inf 
		if isnan(VAL(xstart-1, ystart)) || VAL(xstart-1, ystart) > dist+1
            fan2(xstart-1, ystart, dist+1);
        end
    end
    %Prop right
    if xstart < size(VAL,2) && VAL(xstart + 1, ystart) ~= inf
		if isnan(VAL(xstart+1, ystart)) || VAL(xstart+1, ystart) > dist+1
            fan2(xstart+1, ystart, dist+1);
        end
    end
    %Prop up
    if ystart < size(VAL,1) && VAL(xstart, ystart+1) ~= inf
		if isnan(VAL(xstart, ystart+1)) || VAL(xstart, ystart+1) > dist+1
            fan2(xstart, ystart+1, dist+1);
        end
    end
    %Prop down
    if ystart > 1 && VAL(xstart, ystart-1) ~= inf
		if isnan(VAL(xstart, ystart-1)) || VAL(xstart, ystart-1) > dist+1
            fan2(xstart, ystart-1, dist+1);
        end
    end
end