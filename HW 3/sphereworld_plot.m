function [] = sphereworld_plot(world, xGoal)
sphere_plot(world.xSphereAll,world.rSphereAll)
sphere_plot(world.xSphereAll,world.rInfluenceAll)
plot(xGoal(1), xGoal(2), 'ro', 'linewidth', 2)
end