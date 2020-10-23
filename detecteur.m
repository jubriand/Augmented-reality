function [ D ] = detecteur( I,sigma )
%DETECTEUR Summary of this function goes here
%   Detailed explanation goes here

lambda=0.05;
P=linspace(-10,10,100);
[X,Y]=meshgrid(P,P);
G=1/(2*pi*sigma^2)*exp(-1/(2*sigma^2)*(X^2+Y^2));
Gx=-X/(2*pi*sigma^4)*exp(-1/(2*sigma^2)*(X^2+Y^2));
Gy=-Y/(2*pi*sigma^4)*exp(-1/(2*sigma^2)*(X^2+Y^2));

Ix=conv2(uint8(I),Gx);
Iy=conv2(uint8(I),Gy);

Cxy=conv2((Ix*Iy),G);
Cyx=conv2((Iy*Ix),G);
Cxx=conv2((Ix*Ix),G);
Cyy=conv2((Iy*Iy),G);

D=Cxx*Cyy-Cxy*Cxy-lambda(Cxx+Cyy)^2;

end

