function [val] = wavefront_initialize(xx,yy,xGoal,world)
%Initializes the workspace val. The value of each cell is set to:
%   inf if the midpoint of that cell is within an obstacle
%   0 if it contains the goal location
%   NaN for all other values
%
%   xx,yy are vectors of size NGrid+1, where val will be of size
%       NGridxNgrid
%   xGoal is a 2x1 vector with components [x y]
%   world is a world structure as previously defined

    %initialize all NaN to zero
	val = NaN(length(xx)-1,length(yy)-1);
	%Find the goal location
    found = 0;
	for k = 1:length(xx)-1
		if xGoal(1) <= xx(k+1) && xGoal(1) >= xx(k)
			found = found + 1;
			break;
		end
	end
	for j = 1:length(yy)-1
		if xGoal(2) <= yy(j+1) && xGoal(2) >= yy(j)
			found = found + 1;
			break
		end
	end
	if found == 2
        %Ensure the x and y components are inside the boundary
		val(j,k) = 0;
	else
		found
		error('Goal not inside the workspace')
    end
	for k = 1:length(xx)-1
		for j = 1:length(yy)-1
            %For each cell, check if it hits an obstacle. DO NOT overwrite
            %the goal location
			if sphereworld_collision([(xx(k+1)+xx(k))/2; ...
				(yy(j+1)+yy(j))/2], world) && val(j,k) ~= 0
				val(j,k) = inf;
			end
		end
	end

end


