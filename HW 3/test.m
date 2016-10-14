load('sphereworld')
sphereworld_plot(world,xGoal)

potential.alpha = 10;
potential.type = 'quadratic';
potential.xGoal = xGoal;


% f = @(x) potential_total(x, world, potential);
% hw3_funContour(f)
% f = @(x) -(sphere_potentialGrad(x, world))%, potential));
% hw3_funGradField(f, 50)
% f = @(x) -(potential_attractive(x, potential))
% hw3_funGradField(f, 50)
% f = @(x) -(potential_totalGrad(x, world, potential));
% hw3_funGradField(f, 50)


% potential_planner_test('quadratic', .4, .001)