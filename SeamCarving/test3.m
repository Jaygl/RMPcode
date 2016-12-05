im = imread('wallImageTEST.jpg');
im2 = seamcarving(im, 50);
imshow(im2);
im3 = seam_carveA(im, 50, 5, 0);
imshow(im3);