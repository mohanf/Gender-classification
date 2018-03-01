MU = [0, 1, 2, 3, 4, 5, 6, 7, 8];
NU = [0, 1, 2, 3, 4, 5];
scaleXY = 15;
sigma=2^0.5*pi;
imgSz = 31;

[G GWINLEN] = genGaborKernelF( MU,NU,sigma,scaleXY,imgSz );
GIMG = gaborConvF(IMG,G,GWINLEN) ;
