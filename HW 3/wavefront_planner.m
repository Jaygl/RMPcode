function [ xEvalAll ] = wavefront_planner( xStart,val,xx,yy )
%WAVEFRONT_PLANNER Summary of this function goes here
%   Detailed explanation goes here
	
found = 0;
	for k = 1:length(xx(1,:))-1
		if xStart(1) <= xx(1,k+1) && xStart(1) >= xx(1,k)
			found = found + 1;
			break;
		end
	end
	for j = 1:length(yy(:,1))-1
		if xStart(2) <= yy(j+1,1) && xStart(2) >= yy(j,1)
			found = found + 1;
			break
		end
	end
	if found ~= 2
		found
		error('xStart not inside the workspace')
    end
    xEvalAll = zeros(2,val(j,k)+1);
    xEvalAll(:,1) = [(xx(j,k)+xx(j,k+1))/2; (yy(j,k)+yy(j+1,k))/2];
    [maxj maxk] = size(val);
    for n = 2:length(xEvalAll)
        if j < maxj && val(j+1,k) < val(j,k)
            j = j+1;
        elseif j > 1 && val(j-1,k) < val(j,k)
            j = j-1;
        elseif k < maxk && val(j,k+1) < val(j,k)
            k = k+1;
        elseif k > 1 && val(j,k-1) < val(j,k)
            k = k-1;
        else
            error('xStart isolated from xGoal')
        end
        xEvalAll(:,n) = [(xx(j,k)+xx(j,k+1))/2; (yy(j,k)+yy(j+1,k))/2];
    end
end

