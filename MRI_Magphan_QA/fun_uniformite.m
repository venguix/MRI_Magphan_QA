function [ unif ] = fun_uniformite( I,centro_x,centro_y )
% Uniformidad --> numero de pixels con +-10% de la intensidad
    % media*100%/numero de pixels en el perfil
    
    %PUI: Pourcentage d'Uniformité de l'Image
    %PUI=100*(1-[Imax-Imin]/[Imax+Imin])
%e1=imellipse(gca,[(centro_x)-85 (centro_y)-85 170 170]);%ESTA ES LA BUENA
%e1=imellipse(gca,[(centro_x)-65 (centro_y)-65 130 130]);

figura_uniformidad=figure(1),imshow(I,[]);


%e1=imellipse(gca,[90 90 70 70]);%ROI en el cubo
e1=imellipse(gca,[(centro_x)-65 (centro_y)-65 130 130]);
rmsk1=e1.createMask;
rn1=sum(rmsk1(:));%numero de pixels en la roi
rm1=mean(I(rmsk1));
[mu,sig]=normfit((I(rmsk1)));%Mean, sigma(ecart).. mu=rm1

 %ROIs
        %ROI2
       % e2=imellipse(gca,[(centro_x)-90 (centro_y)-20 20 50]);
       %rmsk2=e2.createMask;
       %[mu2,sig2]=normfit((I(rmsk2)));
        %ROI3
        %e3=imellipse(gca,[(centro_x)+70 (centro_y)-20 20 50]);
       %rmsk3=e3.createMask;
       %[mu3,sig3]=normfit((I(rmsk3)));
        %ROI4
        %e4=imellipse(gca,[(centro_x)-25 (centro_y)+70 50 20]);
      % rmsk4=e4.createMask;
       %[mu4,sig4]=normfit((I(rmsk4)));







maximo=max(I(rmsk1));
minimo=min(I(rmsk1));


%maximo=mu+2*sig;%2*std from mu
%minimo=mu-2*sig;%2*std from mu

maxi=0;
for n=0:maximo
maxi=maxi+1;
end
maxi=maxi-1

mini=0;
for n=0:minimo
mini=mini+1;
end
mini=mini-1;


a=maxi-mini;
b=maxi+mini;
unif=100*(1-(a/b));

imtool(I,'Displayrange',[])

print(figura_uniformidad,'fig_uniformidad','-dpng')
%movefile('fig_uniformidad.png','/Users/MacBookPro/Documents/MATLAB/Guide/html/')

end


