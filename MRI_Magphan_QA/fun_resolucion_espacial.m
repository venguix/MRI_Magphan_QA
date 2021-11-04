function [num_lineas] = fun_Resolucion_espacial( I,pxl_sz,centro_x,centro_y )

%msg=['Place le point sur le point central de l image'];
%h=msgbox(msg,'Aide');
%uiwait(h);
%figure;
%imshow(I,[]); 

%[centro_x,centro_y]=ginput(1)


%% ROIs
ef=imrect(gca,[(centro_x)-36 (centro_y)-43 10 5]);%fond,espace
em=imrect(gca,[(centro_x)-43 (centro_y)-33 3 5]);%materiau
e1=imrect(gca,[(centro_x)-40 87 22 10]);%elemento1
e2=imrect(gca,[(centro_x)-15 87 14 10]);%elemento2
e3=imrect(gca,[(centro_x)+2 87 9 10]);%elemento3
e4=imrect(gca,[(centro_x)+15 87 9 10]);%elemento4
e5=imrect(gca,[(centro_x)+30 (centro_y)-25 6 7]);%elemento5
e6=imrect(gca,[(centro_x)+30 (centro_y)-12 6 7]);%elemento6
e7=imrect(gca,[(centro_x)+30 (centro_y)-1 6 6]);%elemento7
e8=imrect(gca,[(centro_x)+30 (centro_y)+10 6 5]);%elemento8
e9=imrect(gca,[(centro_x)+30 (centro_y)+20 6 4]);%elemento9
e10=imrect(gca,[(centro_x)+30 (centro_y)+28 6 4]);%elemento 10
e11=imrect(gca,[(centro_x)+30 (centro_y)+37 8 3]);%elemento 11
%%


rmsk1=e1.createMask;
rmsk2=e2.createMask;
rmsk3=e3.createMask;
rmsk4=e4.createMask;
rmsk5=e5.createMask;
rmsk6=e6.createMask;
rmsk7=e7.createMask;
rmsk8=e8.createMask;
rmsk9=e9.createMask;
rmsk10=e10.createMask;
rmsk11=e11.createMask;
%
rmskf=ef.createMask;
rmskm=em.createMask;

rm1=mean(I(rmsk1));
desv1=std2(I(rmsk1));
rm2=mean(I(rmsk2));
desv2=std2(I(rmsk2));
rm3=mean(I(rmsk3));
desv3=std2(I(rmsk3));
rm4=mean(I(rmsk4));
desv4=std2(I(rmsk4));
rm5=mean(I(rmsk5));
desv5=std2(I(rmsk5));
rm6=mean(I(rmsk6));
desv6=std2(I(rmsk6));
rm7=mean(I(rmsk7));
desv7=std2(I(rmsk7));
rm8=mean(I(rmsk8));
desv8=std2(I(rmsk8));
rm9=mean(I(rmsk9));
desv9=std2(I(rmsk9));
rm10=mean(I(rmsk10));
desv10=std2(I(rmsk10));
rm11=mean(I(rmsk11));
desv11=std2(I(rmsk11));
%
rmf=mean(I(rmskf));
desvf=std2(I(rmskf));
rmm=mean(I(rmskm));

%% FTM1
FTM11=pi*(sqrt((desv1^2)-(desvf^2)));
FTM12=sqrt(2)*abs(rmm-rmf);
FTM1=FTM11/FTM12

%% FTM2
FTM21=pi*(sqrt((desv2^2)-(desvf^2)));
FTM22=sqrt(2)*abs(rmm-rmf);
FTM2=FTM21/FTM22
%% FTM3
FTM31=pi*(sqrt((desv3^2)-(desvf^2)));
FTM32=sqrt(2)*abs(rmm-rmf);
FTM3=FTM31/FTM32
%% FTM4
FTM41=pi*(sqrt((desv4^2)-(desvf^2)));
FTM42=sqrt(2)*abs(rmm-rmf);
FTM4=FTM41/FTM42
%% FTM5
FTM51=pi*(sqrt((desv5^2)-(desvf^2)));
FTM52=sqrt(2)*abs(rmm-rmf);
FTM5=FTM51/FTM52
%% FTM6
FTM61=pi*(sqrt((desv6^2)-(desvf^2)));
FTM62=sqrt(2)*abs(rmm-rmf);
FTM6=FTM61/FTM62
%% FTM7
FTM71=pi*(sqrt((desv7^2)-(desvf^2)));
FTM72=sqrt(2)*abs(rmm-rmf);
FTM7=FTM71/FTM72
%% FTM8
FTM81=pi*(sqrt((desv8^2)-(desvf^2)));
FTM82=sqrt(2)*abs(rmm-rmf);
FTM8=FTM81/FTM82
%% FTM9
FTM91=pi*(sqrt((desv9^2)-(desvf^2)));
FTM92=sqrt(2)*abs(rmm-rmf);
FTM9=FTM91/FTM92
%% FTM10
FTM101=pi*(sqrt((desv10^2)-(desvf^2)));
FTM102=sqrt(2)*abs(rmm-rmf);
FTM10=FTM101/FTM102

%% FTM11
FTM111=pi*(sqrt((desv11^2)-(desvf^2)));
FTM112=sqrt(2)*abs(rmm-rm4);
FTM11=FTM111/FTM112


%% FTM

M=[FTM1 FTM2 FTM3 FTM4 FTM5 FTM6 FTM7 FTM8 FTM9 FTM10 FTM11];
n=1;
 
    while M(n)>=0.1
        n=n+1;
    end
 
n=n-1


num_lineas=num2str(n,'%0.2f Pairs de lignes');
end

