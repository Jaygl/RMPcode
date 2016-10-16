function [val] = wavefront_initialize(xx,yy,xGoal,world)
	val = NaN(size(xx)-1);
	found = 0;
	for k = 1:length(xx(1,:))-1
		if xGoal(1) <= xx(1,k+1) && xGoal(1) >= xx(1,k)
			found = found + 1;
			break;
		end
	end
	for j = 1:length(yy(:,1))-1
		if xGoal(2) <= yy(j+1,1) && xGoal(2) >= yy(j,1)
			found = found + 1;
			break
		end
	end
	if found == 2
		val(j,k) = 0;
	else
		found
		error('Goal not inside the workspace')
	end

	for k = 1:length(xx(1,:))-1
		for j = 1:length(yy(:,1))-1
			if sphereworld_collision([(xx(1,k+1)+xx(1,k))/2; ...
				(yy(j+1,1)+yy(j,1))/2], world) && val(j,k) ~= 0
				val(j,k) = inf;
			end
		end
	end

end


