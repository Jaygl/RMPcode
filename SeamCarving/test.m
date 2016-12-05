%Load image
im = imread('SuperSimple.jpg');
alpha = 3;
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
Gmag2 = Gmag;
%Create Graph
graphVector = image2graphVector2(Gmag);
idxStart = length(graphVector)-1;
idxGoal = length(graphVector);
route = graph_search2(graphVector, idxStart, idxGoal);

nx = size(im2);
ny = nx(1);
nx = nx(2);
figure
imagesc(Gmag, [0 alpha]);
set(gca,'xtick', linspace(0.5,nx+0.5,nx+1), 'ytick', linspace(0.5,ny+.5,ny+1));
set(gca,'xgrid', 'on', 'ygrid', 'on', 'gridlinestyle', '-', 'xcolor', 'k', 'ycolor', 'k');

Gmag(route(2:end-1))= 2;
droute = path2delete(graphVector, route);
Gmag(droute) = 3;

figure
imagesc(Gmag, [0 alpha]);
set(gca,'xtick', linspace(0.5,nx+0.5,nx+1), 'ytick', linspace(0.5,ny+.5,ny+1));
set(gca,'xgrid', 'on', 'ygrid', 'on', 'gridlinestyle', '-', 'xcolor', 'k', 'ycolor', 'k');
GmagC2 = remove_seam(Gmag2, droute);
GmagC = remove_seam(Gmag, droute);
figure
imagesc(GmagC2, [0 alpha]);
set(gca,'xtick', linspace(0.5,nx+0.5,nx+1), 'ytick', linspace(0.5,ny+.5,ny+1));
set(gca,'xgrid', 'on', 'ygrid', 'on', 'gridlinestyle', '-', 'xcolor', 'k', 'ycolor', 'k');

Gmag = GmagC;
graphVector = image2graphVector2(Gmag);
idxStart = length(graphVector)-1;
idxGoal = length(graphVector);
route = graph_search2(graphVector, idxStart, idxGoal);
Gmag(route(2:end-1))= 2;
droute = path2delete(graphVector, route);
Gmag(droute) = 3;
nx = size(im2);
ny = nx(1);
nx = nx(2);
figure
imagesc(Gmag, [0 alpha]);
set(gca,'xtick', linspace(0.5,nx+0.5,nx+1), 'ytick', linspace(0.5,ny+.5,ny+1));
set(gca,'xgrid', 'on', 'ygrid', 'on', 'gridlinestyle', '-', 'xcolor', 'k', 'ycolor', 'k');
GmagC = remove_seam(Gmag, droute);
GmagC2 = remove_seam(GmagC2, droute);
figure
imagesc(GmagC2, [0 alpha]);
set(gca,'xtick', linspace(0.5,nx+0.5,nx+1), 'ytick', linspace(0.5,ny+.5,ny+1));
set(gca,'xgrid', 'on', 'ygrid', 'on', 'gridlinestyle', '-', 'xcolor', 'k', 'ycolor', 'k');