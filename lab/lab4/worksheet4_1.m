
% part 1 : Visualizing Images/ Matrices

%% (a)
clear all; close all; clc;
I = imread('coach_k.jpg');
save image.mat I

figure
subplot(211)
imshow(I)
title('original image')

image_grayscale = colouredToGray(I);
subplot(212)
imshow(image_grayscale)
title('gray scale image')

%% (b)

figure

subplot(131)
imshow(image_grayscale);
title('grayscale')
axis square

subplot(132)
imagesc(image_grayscale);
colormap gray
axis square
title('imagesc')

subplot(133)
im = image_grayscale./(255/64);
image(im)
colormap gray
caxis([0, 64])
axis square
title('image')

%% v.
load('BME790.mat')

figure
head = Head/max(Head(:));
head1 = Head./(255/64);

subplot(311)
imshow(head);
title('imshow')
axis square

subplot(312)
imagesc(head);
colormap gray
title('imagesc')
axis square

subplot(313)
image(head1);
colormap gray
title('image')
axis square




















