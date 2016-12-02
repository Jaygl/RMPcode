%Load image
im = imread('SuperSimple.jpg');
%Grayscale
im2 = rgb2gray(im);
im2 = im2double(im2);

%% Get gradient magnitude of image

% [Gx Gy] = imgradientxy(im2);
% [Gmag Gdir] = imgradient(Gx,Gy);
%%
Gmag = imcomplement(im2);
%Normalize Gmag to 1
Gmag = Gmag/max(max(Gmag));
%Create Graph
graphVector = image2graphVector2(Gmag);
idxStart = length(graphVector)-1;
idxGoal = length(graphVector);
route = graph_search2(graphVector, idxStart, idxGoal);

Gmag(route(2:end-1))= 2;

nx = size(im2);
ny = nx(1);
nx = nx(2);
imagesc(Gmag);
set(gca,'xtick', linspace(0.5,nx+0.5,nx+1), 'ytick', linspace(0.5,ny+.5,ny+1));
set(gca,'xgrid', 'on', 'ygrid', 'on', 'gridlinestyle', '-', 'xcolor', 'k', 'ycolor', 'k');
