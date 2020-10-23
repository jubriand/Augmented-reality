clear all
close all

obj = VideoReader('videoBase.mp4');
video = obj.read();
Icouleurs = video(:,:,:,100);
%niveau de gris
IR = Icouleurs(:,:,1);
IV = Icouleurs(:,:,2);
IB = Icouleurs(:,:,3);

I = 0.299 * double(IR) + 0.587 * double(IV) + 0.114 * double(IB);
%prendre la luminance plutot
Iluminance=rgb2ycbcr(Icouleurs);
Ilum=Iluminance(:,:,1);

% figure, imshow(uint8(I))

%Ifiltre = (1/2*sqrt(2*pi))*exp(I^2/2*2^2);

% sigma=2;
% lambda=0.05;
% P=linspace(-10,10,100);
% [X,Y]=meshgrid(P,P);
% 
% 
% 
% 
% G=1/(2*pi*sigma^2)*exp(-1/(2*sigma^2)*(X^2+Y^2));
% Gx=-X/(2*pi*sigma^4)*exp(-1/(2*sigma^2)*(X^2+Y^2));
% Gy=-Y/(2*pi*sigma^4)*exp(-1/(2*sigma^2)*(X^2+Y^2));
% figure, surf(Gx),shading interp
% 
% Ix=conv2(Ilum,Gx);
% Iy=conv2(Ilum,Gy);
% 
% reshape(Ix, [1080,1920])
% reshape(Iy, [1080,1920])

% Cxy=conv2((Ix.*Iy),G);
% Cyx=conv2((Iy.*Ix),G);
% Cxx=conv2((Ix.*Ix),G);
% Cyy=conv2((Iy.*Iy),G);
% 
% D=Cxx*Cyy-Cxy*Cxy-lambda(Cxx+Cyy)^2;

sigma=2;
D=detecteur(Ilum,sigma);

seuil =-3;
A=D;
for i=1:100
    for j=1:100
        
        if (D(i,j)>seuil)
            A(i,j)=0;
        end
    end
end

