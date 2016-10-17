function [] = sphere_plot(xSphere, rSphere)
%Plots a circle centered at xSphere with radius rSphere
%xSphere is a 2xN vector where xSphere(:,n) is the [x; y] center coordinate
%rSphere is a 1xN vector where rSphere(n) is the radius of the nth sphere 

x = xSphere(1,:);
y = xSphere(2,:);
phi = [0:.01:2*pi];

%Calculate the circle and plot each sphere individually
for k=1:length(rSphere)
	x_p = rSphere(k)*cos(phi);
	y_p = rSphere(k)*sin(phi);
	plot(x(k)+x_p, y(k)+y_p, 'linewidth', 2)
	hold on
end
axis square