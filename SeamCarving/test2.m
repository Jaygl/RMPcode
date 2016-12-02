alpha = 5;
%Load image
im = imread('testImage2.jpg');
%Grayscale
im2 = rgb2gray(im);
im2 = im2double(im2);

%% Get gradient magnitude of image

[Gx Gy] = imgradientxy(im2);
[Gmag Gdir] = imgradient(Gx,Gy);
%%
%Normalize Gmag to alpha
Gmag = alpha * Gmag/max(max(Gmag));

%Create Graph
graphVector = image2graphVector2(Gmag);
idxStart = length(graphVector)-1;
idxGoal = length(graphVector);
route = graph_search2(graphVector, idxStart, idxGoal);

Gmag(route(2:end-1))= 2*alpha;


imagesc(Gmag);
