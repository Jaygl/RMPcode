function [URep] = sphere_potential(xEval,world)
r = world.rSphereAll;
x = world.xSphereAll(1,:);
y = world.xSphereAll(2,:);
influence = world.rInfluenceAll;
URep = 0;
for k = 1:length(r)
	d = sqrt((x(k) - xEval(1))^2 + (y(k)-xEval(2))^2);
	%Determine if Boundary or Obstacle
	
	if r(k) > influence(k)
		%Boundary
		if d >= r(k)
			%Outside Boundary
			URep = NaN;
			disp('Outside Boundary')
			return
		else
			if d > influence(k)
				URep = 1/2*(1/(r(k)-d)- 1/(r(k)-influence(k)))^2 ...
					+ URep;
			end
		end
	else
		if d <= r(k)
			%Inside obstacle
			URep = NaN;
			disp('Inside Obstacle')
			return
		else
			%Obstacle
			if d < influence(k)
				URep = 1/2*(1/(d-r(k))-1/(influence(k)-r(k)))^2 ...
					+ URep;
			end
		end
	end
end
