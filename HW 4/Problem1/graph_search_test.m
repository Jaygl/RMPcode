function [] = graph_search_test(bool)
%GRAPH_SEARCH_TEST Test function which can either generate a random graph
%(bool = 0) or load a graph saved in MyTestData (bool = 1). The graph is
%then displayed on an x,y grid with dotted lines drawn between connected
%nodes. Start and end nodes are chosen and graph_search is run on the grid,
%displaying the shortest path between the two nodes, if one exists.
%   bool is a boolean 1 or 0 to switch between loading data (1) and
%       randomly generating data (0)

%Load or generate the data
if bool
    load('MyTestData.mat')
else
    xGrid = [1:10];
    yGrid = [1:10];
    flag = round(rand(10,10));
    graph = grid2graph(xGrid,yGrid,flag);
    mystart = randi(length(graph));
    myend = randi(length(graph));
end

%Plot the graph and the connections
figure
hold on
for k = 1:length(graph)
    plot(graph(k).x(1), graph(k).x(2), 'ko')
    for j = 1:length(graph(k).neighbors)
        vals = [graph(k).x graph(graph(k).neighbors(j)).x];
        plot(vals(1,:), vals(2,:), 'b:')
    end
end
%Plot the start and goal nodes.
plot(graph(mystart).x(1), graph(mystart).x(2), 'ro', 'linewidth', 3)
plot(graph(myend).x(1), graph(myend).x(2), 'rx', 'linewidth', 3)

%Save the data if it is newly created.
if ~bool
    save('MyTestData.mat', 'graph', 'mystart', 'myend', 'flag')
end

%Use graph_search to find the shortest path between start and goal nodes,
%and then plot the path if it exists.
path = graph_search(graph, mystart, myend);
if length(path) > 0
    for k = 1:length(path) - 1
        vals = [graph(path(k)).x graph(path(k+1)).x];
        plot(vals(1,:), vals(2,:), 'r-', 'linewidth', 2)
    end
else
    display('No path found')
end









