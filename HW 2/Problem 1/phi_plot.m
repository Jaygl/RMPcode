function [  ] = phi_plot(  )
%PHI_PLOT Plots the stereographic mapping of a grid of (x,y) points 
%[-1.5: 1.5] onto the unit sphere. This is done for both the north and
%south projections, which yields 2 different surfaces, each covering a
%different hemisphere (with some overlap, which is good). 


%Define the grid of points that we will then project onto the sphere.
[X,Y] = meshgrid(linspace(-1.5, 1.5, 31),linspace(-1.5, 1.5, 31));
%Used for colloring the surfaces differently, not imperative.
mycolor = ones(31,31);

%Perform the mapping from X,Y to x,y,z for both north and south projections
[xn yn zn] = phiNinv(X,Y);
[xs ys zs] = phiSinv(X,Y);

%Plot the surfaces
surf(xn, yn, zn, mycolor, 'FaceAlpha', 0.75)
hold on
surf(xs, ys, zs, mycolor./2, 'FaceAlpha', 0.75)
%Square the axis, so it's a sphere...
axis square
xlabel('X')
ylabel('Y')
zlabel('Z')

end

