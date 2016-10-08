function [] = sphere_plot(xSphere, rSphere)

x = xSphere(1,:);
y = xSphere(2,:);
phi = [0:.01:2*pi];

for k=1:length(rSphere)
	x_p = rSphere(k)*cos(phi);
	y_p = rSphere(k)*sin(phi);
	plot(x(k)+x_p, y(k)+y_p, 'linewidth', 2)
	hold on
end
axis square