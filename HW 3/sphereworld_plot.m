function [] = sphereworld_plot(world, xGoal)
sphere_plot(world.xSphereAll,world.rSphereAll)
sphere_plot(world.xSphereAll,world.rInfluenceAll)
end