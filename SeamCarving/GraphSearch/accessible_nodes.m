function [nodeList] = accessible_nodes(graphVector, ind)

myNodes = [ind];
nodeList = [];
while ~isempty(myNodes)
	ind = myNodes(end);
	nodeList = [nodeList ind];
	myNodes(end) = [];
	toAdd = graphVector(ind).neighbors;
	toAdd = toAdd(~ismember(toAdd, nodeList));
	myNodes = unique([myNodes toAdd]);
end
