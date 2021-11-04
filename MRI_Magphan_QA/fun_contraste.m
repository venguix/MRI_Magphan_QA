function [ int1, int2, int3, int4 ] = fun_contraste( I,pxl_sz )


imstd=stdfilt(I,ones(3));%binarizacion
bw=imstd>200;
bw2=bwareaopen(bw,150);% Eliminar elementos con area inferior a P (pixels)
cc=bwconncomp(bw2);% Determinar objetos conectados
propied=regionprops(cc,'Area');% Area de cada componente
L=labelmatrix(cc);% Eliminar objetos mayores de 300
BW3=ismember(L,find([propied.Area]<=300));
propied2=regionprops(BW3);

% Calculos para la creacion de los ROIs
c1=struct2cell(propied2);
%Areas --> c1(1,1) c1(1,2)...
Mareas=[c1(1,1) c1(1,2) c1(1,3) c1(1,4)];
%Centroides
centro1=cell2mat(c1(2,1));
centro2=cell2mat(c1(2,2));
centro3=cell2mat(c1(2,3));
centro4=cell2mat(c1(2,4));
Mcentros=[centro1;centro2;centro3;centro4];
%BoundingBox
bounding1=cell2mat(c1(3,1));
bounding2=cell2mat(c1(3,2));
bounding3=cell2mat(c1(3,3));
bounding4=cell2mat(c1(3,4));
    %Radios
    radio1=bounding1(3);
    radio2=bounding2(3);
    radio3=bounding3(3);
    radio4=bounding4(3);
    %Posiciones
    posicion1=[bounding1(1) bounding1(2)];
    posicion2=[bounding2(1) bounding2(2)];
    posicion3=[bounding3(1) bounding3(2)];
    posicion4=[bounding4(1) bounding4(2)];
    
% Crear ROIs
e1=imellipse(gca,[posicion1(1)+4 posicion1(2)+4 radio1-9 radio1-9]);
e2=imellipse(gca,[posicion2(1)+4 posicion2(2)+4 radio2-9 radio2-9]);
e3=imellipse(gca,[posicion3(1)+4 posicion3(2)+4 radio3-9 radio3-9]);
e4=imellipse(gca,[posicion4(1)+4 posicion4(2)+4 radio4-9 radio4-9]);


%e1=imellipse(gca,[124 244 27 27]);
%e2=imellipse(gca,[364 244 27 27]);
%e3=imellipse(gca,[244 125 27 27]);
%e4=imellipse(gca,[244 360 27 27]);

% ROI1
rmsk1=e1.createMask;
rn1=sum(rmsk1(:));%elements
rm1=mean(I(rmsk1));
Intensity1=sprintf('%0.2f',rm1)

int1=num2str(rm1,'Intensity 1: %0.2f');

% ROI2
rmsk2=e2.createMask;
rn2=sum(rmsk2(:));%elements
rm2=mean(I(rmsk2));
Intensity2=sprintf('%0.2f',rm2)

int2=num2str(rm2,'Intensity 2: %0.2f');

% ROI3
rmsk3=e3.createMask;
rn3=sum(rmsk3(:));%elements
rm3=mean(I(rmsk3));
Intensity3=sprintf('%0.2f',rm3)

int3=num2str(rm3,'Intensity 3: %0.2f');

% ROI4
rmsk4=e4.createMask;
rn4=sum(rmsk4(:));%elements
rm4=mean(I(rmsk4));
Intensity4=sprintf('%0.2f',rm4);

int4=num2str(rm4,'Intensity 4: %0.2f')
end

