function [flag] = sphereworld_collision(xEval, world)

	flag = 0;
	for k = 1:length(world.rSphereAll)
		x = world.xSphereAll(1,k);
		y = world.xSphereAll(2,k);
		d = sqrt((xEval(1)-x)^2+(xEval(2)-y)^2);
		if world.rSphereAll(k) > world.rInfluenceAll(k)
			%Boundary
			if d >= world.rSphereAll(k)
				flag = 1;
				return
			end
		else
			%Obstacle
			if d <= world.rSphereAll(k)
				flag = 1;
				return
			end
		end
	end
end