target = 1201;
im = zeros(20,120);
[graphVector z] = image2graphVector(im);
[nodeList] = accessible_nodes(graphVector, target);

nodeList = unique(nodeList);

if ismember(numel(im)+1, nodeList)
	nodeList = nodeList(1:end-1);
end

if ismember(numel(im)+2, nodeList)
	nodeList = nodeList(1:end-1);
end

im(nodeList) = 1;
pcolor(im);

