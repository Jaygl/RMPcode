function [URep] = sphere_potential(xEval,world)
%Determine the total repulsive potential at point xEval within world world.
%   xEval is a 2x1 vector with components [x;y]
%   world is a world structure as defined earlier in the HW. 
%   URep is a scaler denoting the field strength at xEval

%Simplify some variable names
r = world.rSphereAll;
x = world.xSphereAll(1,:);
y = world.xSphereAll(2,:);
influence = world.rInfluenceAll;

%Initialize the starting potential to zero
URep = 0;
%For each obstacle, determine its effect at position xEval and then sum.
for k = 1:length(r)
	d = sqrt((x(k) - xEval(1))^2 + (y(k)-xEval(2))^2);
	
    %Determine if Boundary or Obstacle
	if r(k) > influence(k)
		%Boundary
		if d >= r(k)
			%Outside Boundary
			URep = NaN;
			return
		else
			if d > influence(k)
                %Inside zone of influence
				URep = 1/2*(1/(r(k)-d)- 1/(r(k)-influence(k)))^2 ...
					+ URep;
			end
		end
	else
		if d <= r(k)
			%Inside obstacle
			URep = NaN;
			return
		else
			%Obstacle
			if d < influence(k)
                %Inside zone of influence
				URep = 1/2*(1/(d-r(k))-1/(influence(k)-r(k)))^2 ...
					+ URep;
			end
		end
	end
end
