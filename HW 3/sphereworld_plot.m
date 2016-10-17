function [] = sphereworld_plot(world, xGoal)

%Plot the Obstacles in world (uses the definition of world defined in HW)
%world - Structure defined in HW, contains fields rSphereAll, xSphereAll,
%and rInfluenceAll.

%Plot the obstacles
sphere_plot(world.xSphereAll,world.rSphereAll)
%Plot the sphere of influence of each obstacle
sphere_plot(world.xSphereAll,world.rInfluenceAll)
%Plot the goal location
plot(xGoal(1,:), xGoal(2,:), 'ko', 'linewidth', 2)

end