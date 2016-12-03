function [graphVector z] = image2graphVector2(Gmag)
solo = .5;
diag = .75; %.75
z = size(Gmag);
num_nodes = numel(Gmag);
goalIdx = num_nodes + 2;
startIdx = num_nodes + 1;

%%Handle Top and middle section
for k = 1:z(1)-1
	ind = sub2ind(z,k,1);
	graphVector(ind).x = [1; k];
	graphVector(ind).neighbors = [sub2ind(z, k, 2) sub2ind(z, k+1, 1) ...
        sub2ind(z, k+1, 2)];
    graphVector(ind).neighborsCost = [.01 .014 .01];
    graphVector(ind).cost = Gmag(ind);
	for j = 2:z(2)-1
		ind = sub2ind(z, k, j);
		graphVector(ind).x = [j; k];
		graphVector(ind).neighbors = [sub2ind(z, k, j-1) sub2ind(z, k+1, j-1) ...
			sub2ind(z, k+1, j) sub2ind(z, k+1, j+1) sub2ind(z, k, j+1)];
        graphVector(ind).neighborsCost = [solo diag solo diag solo];
        graphVector(ind).cost = Gmag(ind);
	end
	ind = sub2ind(z,k,z(2));
	graphVector(ind).x = [z(2); k];
	graphVector(ind).neighbors = [sub2ind(z, k, z(2)-1) sub2ind(z, k+1, z(2)-1) sub2ind(z, k+1, z(2))];
    graphVector(ind).neighborsCost = [solo diag solo];

    graphVector(ind).cost = Gmag(ind);
end

%Last row of image (only neighbor is goalNode)
for j = 1:z(2)
	ind = sub2ind(z, z(1), j);
	graphVector(ind).x = [j; z(1)];
	graphVector(ind).neighbors = [goalIdx];
    graphVector(ind).neighborsCost = [0];
    graphVector(ind).cost = Gmag(ind);
end

%Initialize goalNode
graphVector(goalIdx).x = [z(2)/2; z(1)+1];
graphVector(goalIdx).neighbors = [];
graphVector(goalIdx).cost = 0;

%Initialize startNode
graphVector(startIdx).x = [z(2)/2; 0];
graphVector(startIdx).neighbors = sub2ind(z, ones(1, z(2)), [1:z(2)]);
graphVector(startIdx).neighborsCost = zeros(1, z(2));
graphVector(startIdx).cost = 0;

%graphVector(1).x = [];
%graphVector(1).neighbors = [];
%graphVector(1).neighborsCost = [];
%graphVector(1).g = [];
%graphVector(1).backpointer = [];
%graphVector = repmat(graphVector, num_nodes+2);