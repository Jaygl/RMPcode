im = imread('SuperSimple.jpg');
im2 = rgb2gray(im);
im2 = im2double(im2);
alpha = 3;
Gmag = imcomplement(im2);
Gmag = Gmag/max(max(Gmag));
Gmag2 = seamcarving2(Gmag, 2);

nx = size(im2);
ny = nx(1);
nx = nx(2);

imagesc(Gmag, [0 alpha])
set(gca,'xtick', linspace(0.5,nx+0.5,nx+1), 'ytick', linspace(0.5,ny+.5,ny+1));
set(gca,'xgrid', 'on', 'ygrid', 'on', 'gridlinestyle', '-', 'xcolor', 'k', 'ycolor', 'k');
figure
imagesc(Gmag2, [0 alpha])
set(gca,'xtick', linspace(0.5,nx+0.5,nx+1), 'ytick', linspace(0.5,ny+.5,ny+1));
set(gca,'xgrid', 'on', 'ygrid', 'on', 'gridlinestyle', '-', 'xcolor', 'k', 'ycolor', 'k');