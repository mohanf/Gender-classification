MU = [0, 1, 2, 3, 4, 5, 6, 7];
NU = [0, 1, 2, 3, 4];
scaleXY = 7;
sigma=2^0.5*pi;
imgSz = 20;
a = load('train_no_hist_shuffle.mat');
b = a.train_struct;
IMG = b.images{1};
IMG = im2double(imresize(IMG, [30 30]));
imshow(IMG);

[G GWINLEN] = genGaborKernelF( MU,NU,sigma,scaleXY,imgSz );
GIMG = gaborConvF(IMG,G,GWINLEN) ;
figure;
imshow(GIMG{1,5});
