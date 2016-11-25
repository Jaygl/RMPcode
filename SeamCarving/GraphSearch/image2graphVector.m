function [graphVector z] = image2graphVector(im)

z = size(im);
num_nodes = numel(im);
goalIdx = num_nodes + 2;
startIdx = num_nodes + 1;

graphVector(1).x = [];
graphVector(1).neighbors = [];
graphVector(1).neighborsCost = [];
graphVector(1).g = [];
graphVector(1).backpointer = [];
graphVector = repmat(graphVector, num_nodes+2);

%%Handle Top and middle section
for k = 1:z(1)-1
	ind = sub2ind(z,k,1);
	graphVector(ind).x = [1; k];
	graphVector(ind).neighbors = [sub2ind(z, k+1, 1), sub2ind(z, k+1, 2)];
	for j = 1:z(2)-1
		ind = sub2ind(z, k, j);
		graphVector(ind).x = [j; k];
		graphVector(ind).neightbors = [sub2ind(z, k+1, j-1) ...
			sub2ind(z, k+1, j) sub2ind(z, k+1, j+1)];
	end
	ind = sub2ind(z,k,z(2))
	graphVector(ind).x = [z(2); k];
	graphVector(ind).neighbors = [sub2ind(z, k+1, z(2)-1), sub2ind(z, k+1, z(2))];
end

%Last row of image (only neighbor is goalNode)
for j = 1:z(2)
	ind = sub2ind(z, z(1), j);
	graphVector(ind).x = [z(1); j];
	graphVector(ind).neighbors = [goalIdx];
end

%Initialize goalNode
graphVector(goalIdx).x = [z(2)/2 0];
graphVector(goalIdx).neighbors = sub2ind(z, ones(1, z(2)), [1:z(2)]);
