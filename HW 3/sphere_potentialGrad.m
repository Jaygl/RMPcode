function [gradURep] = sphere_potentialGrad(xEval, world)
%Determine the gradient of the repulsive potential at point xEval within world world.
%   xEval is a 2x1 vector with components [x;y]
%   world is a world structure as defined earlier in the HW
%   gradURep is a 1x2 gradient vector containing the [x, y] components

%Simplify some variable names
r = world.rSphereAll;
x = world.xSphereAll(1,:);
y = world.xSphereAll(2,:);
influence = world.rInfluenceAll;

%Initialize the starting gradient to zero
gradURep = [0; 0];
%For each obstacle, determine its effect at position xEval and then sum.
for k = 1:length(r)
	d = sqrt((x(k) - xEval(1))^2 + (y(k)-xEval(2))^2);
	
    %Determine if Boundary or Obstacle
    if r(k) > influence(k)
		%Boundary
		if d >= r(k)
			%Outside Boundary
			gradURep = [NaN; NaN];
			return
		else
			if d > influence(k)
                %Inside zone of influence
				gradURep = (1/(r(k)-d) - 1/(r(k)-influence(k))) ...
					* 1/(r(k)-d)^2 * (xEval - [x(k); y(k)])/d + ...
					gradURep; 
			end
		end
	else
		if d <= r(k)
			%Inside obstacle
			gradURep = [NaN; NaN];
			return
		else
			%Obstacle
			if d < influence(k)
                %Inside zone of influence
				gradURep = -(1/(d-r(k)) - 1/(influence(k) - r(k))) ...
					* 1/(d-r(k))^2 * (xEval - [x(k); y(k)])/d + ...
					gradURep;
			end
		end
	end
end
