function [ im ] = seam_carveA( im, m, alpha, Gmag_flag )
%SEAM_CARVEA Seam carving using A* approach on A GMAG IMAGE
%   Detailed explanation goes here
plot_flag = 1;
if ~Gmag_flag
    im2 = rgb2gray(im);
    im2 = im2double(im2);
    [Gx, Gy] = imgradientxy(im2);
    [Gmag, ~] = imgradient(Gx,Gy);
else
    im2 = rgb2gray(im);
    im2 = im2double(im2);
    Gmag = imcomplement(im2);
end

%Normalize Gmag to alpha
Gmag = alpha * Gmag/max(max(Gmag));

for k = 1:m
    k
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
    if plot_flag
        imagesc(Gmag);
        set(gca,'xtick', linspace(0.5,nx+0.5,nx+1), 'ytick', linspace(0.5,ny+.5,ny+1));
        set(gca,'xgrid', 'on', 'ygrid', 'on', 'gridlinestyle', '-', 'xcolor', 'k', 'ycolor', 'k');
    end
    GmagC = remove_seam(Gmag, droute);
    imC = remove_seam(im, droute);
    if plot_flag
        figure
        imagesc(GmagC);
        set(gca,'xtick', linspace(0.5,nx+0.5,nx+1), 'ytick', linspace(0.5,ny+.5,ny+1));
        set(gca,'xgrid', 'on', 'ygrid', 'on', 'gridlinestyle', '-', 'xcolor', 'k', 'ycolor', 'k');
        imagesc(imC);
    end
    Gmag = GmagC;
    im = imC;
end

