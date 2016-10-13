load('sphereworld.mat')
sphereworld_plot_test()
x = [-1.7 0 0];
y = [0 0 -1.65];
for k = 1:length(x)
	xEval = [x(k);y(k)];
	grad = sphere_potentialGrad(xEval, world);
	quiver(x(k), y(k), grad(1), grad(2))
end