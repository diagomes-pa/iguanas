clear all;

pkg load image;
pkg load signal;

graphics_toolkit("fltk");
 
x_rgb = imread("../../data/lena_512_512.png");
x = rgb2gray(x_rgb);

x_dec2 = imresize(x,1/2);
x_dec4 = imresize(x_dec2,1/2);
x_dec8 = imresize(x_dec4,1/2);

imshow(x_dec2);