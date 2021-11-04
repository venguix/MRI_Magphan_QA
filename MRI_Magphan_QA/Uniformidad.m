%Uniformidad

I=dicomread('MAGPHAN.MR.QA_WEEKLY.0010.0030.2015.02.17.11.57.17.111091.91302535');
h_im=imshow(I,[])
[centro_x, centro_y]=ginput(1);

%%
e1=imellipse(gca,[90 90 70 70]);
rmsk1=e1.createMask;
rn1=sum(rmsk1(:));%numero de pixels en la roi
rm1=mean(I(rmsk1));

maximo=max(I(rmsk1))
minimo=min(I(rmsk1))

maxi=0;
for n=0:maximo
maxi=maxi+1;
end
maxi=maxi-1

mini=0;
for n=0:minimo
mini=mini+1;
end
mini=mini-1


a=maxi-mini;
b=maxi+mini;
unif=100*(1-(a/b))
