function [ xEvalAll ] = wavefront_planner( xStart,val,xx,yy )
%Wavefront planner to descend the values in grid val starting at point
%xStart. xx and yy are are the corresponding linspaces of the grid's
%physical dimensions. xEvalAll is a 2xNstep array with components
%xEvalAll(:,n) of [x;y] where the coordinates represent the cell midpoint.
%   xStart is a 2x1 vector defining the start location as [x;y]
%   val is an initialized and propagated wavefront grid of size
%   (NGridxNGrid)
%   xx and yy are vectors of length (NGrid+1) which denote the physical
%   spacing of the grid val
	
%Find the starting location
found = 0;
	for k = 1:length(xx)-1
		if xStart(1) <= xx(k+1) && xStart(1) >= xx(k)
			found = found + 1;
			break;
		end
	end
	for j = 1:length(yy)-1
		if xStart(2) <= yy(j+1) && xStart(2) >= yy(j)
			found = found + 1;
			break
		end
	end
	if found ~= 2
        %Make sure it is inside the workspace
		found
		error('xStart not inside the workspace')
    end
    
    %Initialize the steps we are taking  (we know it should take as many
    %steps as the distance in our current position + 1).
    xEvalAll = zeros(2,val(j,k)+1);
    xEvalAll(:,1) = [(xx(k)+xx(k+1))/2; (yy(j)+yy(j+1))/2];
    [maxj maxk] = size(val);
    %For each step, determine which direction goes towards goal.
    for n = 2:length(xEvalAll)
        %Check up
        if j < maxj && val(j+1,k) < val(j,k)
            j = j+1;
        %Check down
        elseif j > 1 && val(j-1,k) < val(j,k)
            j = j-1;
        %Check right
        elseif k < maxk && val(j,k+1) < val(j,k)
            k = k+1;
        %Check left
        elseif k > 1 && val(j,k-1) < val(j,k)
            k = k-1;
        else
            %If we can't find a path, something is wrong and we are
            %isolated from the goal
            error('xStart isolated from xGoal')
        end
        xEvalAll(:,n) = [(xx(k)+xx(k+1))/2; (yy(j)+yy(j+1))/2];
    end
end

