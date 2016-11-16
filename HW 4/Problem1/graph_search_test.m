% function [] = graph_search_test(bool)
%GRAPH_SEARCH_TEST Summary of this function goes here
%   Detailed explanation goes here

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

figure
hold on
for k = 1:length(graph)
    plot(graph(k).x(1), graph(k).x(2), 'ko')
    for j = 1:length(graph(k).neighbors)
        vals = [graph(k).x graph(graph(k).neighbors(j)).x];
        plot(vals(1,:), vals(2,:), 'b:')
    end
end
plot(graph(mystart).x(1), graph(mystart).x(2), 'ro', 'linewidth', 3)
plot(graph(myend).x(1), graph(myend).x(2), 'rx', 'linewidth', 3)

if ~bool
    save('MyTestData.mat', 'graph', 'mystart', 'myend', 'flag')
end

path = graph_search(graph, mystart, myend);
if length(path) > 0
    for k = 1:length(path) - 1
        vals = [graph(path(k)).x graph(path(k+1)).x];
        plot(vals(1,:), vals(2,:), 'r-', 'linewidth', 5)
    end
else
    display('No path found')
end









