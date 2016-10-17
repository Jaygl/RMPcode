function [] = fan2(xstart, ystart, dist)
    %Recursive function for propagating the wavefront in global variable
    %VAL (to avoid passing large data). xstart,ystart is the initial
    %position in index, where dist is the distance from the previous point.
    %   xstart is a scaler index into VAL
    %   ystart is a scaler index into VAL
    %   dist is the distance from the goal location.
	global VAL;
    VAL(xstart, ystart) = dist;
	
    %Prop left if possible and if the value is NaN or > the current path
	if xstart > 1 && VAL(xstart - 1, ystart) ~= inf 
		if isnan(VAL(xstart-1, ystart)) || VAL(xstart-1, ystart) > dist+1
            fan2(xstart-1, ystart, dist+1);
        end
    end
    %Prop right if possible and if the value is NaN or > the current path
    if xstart < size(VAL,2) && VAL(xstart + 1, ystart) ~= inf
		if isnan(VAL(xstart+1, ystart)) || VAL(xstart+1, ystart) > dist+1
            fan2(xstart+1, ystart, dist+1);
        end
    end
    %Prop up if possible and if the value is NaN or > the current path
    if ystart < size(VAL,1) && VAL(xstart, ystart+1) ~= inf
		if isnan(VAL(xstart, ystart+1)) || VAL(xstart, ystart+1) > dist+1
            fan2(xstart, ystart+1, dist+1);
        end
    end
    %Prop down if possible and if the value is NaN or > the current path
    if ystart > 1 && VAL(xstart, ystart-1) ~= inf
		if isnan(VAL(xstart, ystart-1)) || VAL(xstart, ystart-1) > dist+1
            fan2(xstart, ystart-1, dist+1);
        end
    end
end