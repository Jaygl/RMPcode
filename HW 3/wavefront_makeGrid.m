function [xx, yy] = wavefront_makeGrid(NGrid)
	x = linspace(-2,2,NGrid+1);
	[xx yy] = meshgrid(x);
end