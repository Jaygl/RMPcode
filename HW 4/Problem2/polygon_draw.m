function [  ] = polygon_draw( vertices )
%POLYGON_DRAW draws the edges of the polygon defined in vertices
%on the current figure. 
%	Vertices is an 2xN array where vertices(:,1) holds the x components
%	of the vertices, and vertices(:,2) holds the y components.

plot([vertices(1,:) vertices(1,1)], [vertices(2,:) vertices(2,1)])