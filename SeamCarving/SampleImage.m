load('Removed50.mat')
figure
imshow(im)
title('Original')
figure
imshow(im2)
title('50 Seams Removed')

load('Removed100.mat')
figure
imshow(im2)
title('100 Seams Removed')

load('Removed150.mat')
figure
imshow(im2)
title('150 Seams Removed')

load('Removed200.mat')
figure
imshow(im2)
title('200 Seams Removed')

im2 = seamcarving(im, 150);
figure
imshow(im2)
title('Original Seam Carving, 150 Seams Removed')