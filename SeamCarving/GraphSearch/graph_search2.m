function [ path ] = graph_search2( graphVector, idxStart, idxGoal )
%GRAPH_SEARCH graph search algorithm that searches the structure graphVector 
%for idxGoal from idxStart using the A* algorithm.
%   Detailed explanation goes here
Debug = 0;
if Debug
    im2 = imread('SuperSimple.jpg');
    im2 = rgb2gray(im2);
    nx = size(im2);
    ny = nx(1)
    nx = nx(2)
    Gmag = imcomplement(im2);
    %Normalize Gmag to 1
    Gmag = Gmag/max(max(Gmag));
end
path = [];
C = [];
pqOpen = priorityPrepare();
dist = heuristic(graphVector, idxStart, idxGoal);
pqOpen = priorityPush(pqOpen, idxStart, dist);
graphVector(idxStart).g = 0;
graphVector(idxStart).backpointer = 0;

while ~isempty(pqOpen)
    if Debug
        disp('pqOpen')
        [[pqOpen.key]' [pqOpen.cost]']
    end
    %Get the next best node to try and remove from pqOpen
    [pqOpen, idxNBest, cost] = priorityMinPop(pqOpen);
    if Debug
        disp('Best idxNBest and cost')
        [idxNBest cost]
    end
    %Check if this is goal location
    if idxNBest == idxGoal
        path = buildPath(graphVector,idxStart,idxGoal);
        return
    end
    %Mark this node as closed
    C(end+1) = idxNBest;
    %Get the list of possible neighbors to expand, no closed nodes
    open_paths = getExpandList(graphVector, idxNBest, C);
    
    if Debug
        close all
        disp('Nodes to expand')
        open_paths
        im3 = Gmag;
        if sum(open_paths > nx*ny) == 0
            im3(open_paths) = 2;
        end
        if idxNBest <= nx*ny
            im3(idxNBest) = 3;
        end
        imagesc(im3);
        set(gca,'xtick', linspace(0.5,nx+0.5,nx+1), 'ytick', linspace(0.5,ny+.5,ny+1));
        set(gca,'xgrid', 'on', 'ygrid', 'on', 'gridlinestyle', '-', 'xcolor', 'k', 'ycolor', 'k');
        pause
    end
    %Expand each possible neighbor
    for k = 1:length(open_paths)
        [graphVector pqOpen] = expandVertex3(graphVector, idxNBest, open_paths(k), idxGoal, pqOpen);
    end
end