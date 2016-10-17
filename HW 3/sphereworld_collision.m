function [flag] = sphereworld_collision(xEval, world)
%This function takes an input point xEval and evaluates whether there are
%any collisions with the obstacles described in the struct world.
%   xEval is a 2x1 vector with components [x; y]
%   world is a world structure as previously described
%   flag is a boolean with 1 denoting a collision, 0 no collision

    %Assume no collision
	flag = 0;
    %Check each individual obstacle seperately
	for k = 1:length(world.rSphereAll)
        %Simplify variable names
		x = world.xSphereAll(1,k);
		y = world.xSphereAll(2,k);
		d = sqrt((xEval(1)-x)^2+(xEval(2)-y)^2);
		if world.rSphereAll(k) > world.rInfluenceAll(k)
			%Boundary
			if d >= world.rSphereAll(k)
                %Outside the boundary
				flag = 1;
				return
			end
		else
			%Obstacle
			if d <= world.rSphereAll(k)
                %Inside the obstacle
				flag = 1;
				return
			end
		end
	end
end