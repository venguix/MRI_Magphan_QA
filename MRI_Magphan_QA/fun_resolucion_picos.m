function [count] = fun_resolucion_picos( I,centro_x,centro_y,pxl_sz )


figura_resolucion=figure(1),imshow(I,[]);

xline=[centro_x-45,centro_x+30,centro_x+30];
yline=[centro_y-30,centro_y-30,centro_y+43];

y=improfile(I,xline,yline);

talla=size(y)
y_mean=mean(y);
maximo=max(y)
minimo=min(y)

M=[1:talla(1)];

for n=1:talla(1)
    if y(n)>y_mean
        M(n)=y(n);
        n=n+1;
    else
        M(n)=y_mean;
        n=n+1;
    end
end
eje_x=160*pxl_sz;

   [talla u]=size(y);
   
   for u=1:(talla-1)
       if y(u)<2300
           y(u)=2300;
           u=u+1;
       else
           y(u)=y(u);
           u=u+1;
       end 
       
   end

for m=1:(talla(1)-1)
  if(M(m+1)<(M(m)-0.02*M(m))) | (M(m+1)>(0.02*M(m)+M(m)))
      M(m+1)=M(m+1);
      m=m+1;
  else
      M(m+1)=M(m);
      m=m+1;
  
  end
end
 


   
 




y1=M(1:30);%29
y2=M(30:46);%16
y3=M(46:59);%13
y4=M(59:72);%13
y5=M(73:93);%10
y6=M(92:105);%10
y7=M(104:110);%10
y8=M(113:123);%10
y9=M(124:132);%8
y10=M(133:141);%8
y11=M(144:146);%3


figura_curvas=figure(2),
subplot(3,4,1);plot(y1)
[pks1 locs1]=findpeaks(y1);
subplot(3,4,2);plot(y2)
[pks2 locs2]=findpeaks(y2);
subplot(3,4,3);plot(y3)
[pks3 locs3]=findpeaks(y3);
subplot(3,4,4);plot(y4)
[pks4 locs4]=findpeaks(y4);
subplot(3,4,5);plot(y5)
[pks5 locs5]=findpeaks(y5);
subplot(3,4,6);plot(y6)
[pks6 locs6]=findpeaks(y6);
subplot(3,4,7);plot(y7)
[pks7 locs7]=findpeaks(y7);
subplot(3,4,8);plot(y8)
[pks8 locs8]=findpeaks(y8);
subplot(3,4,9);plot(y9)
[pks9 locs9]=findpeaks(y9);
subplot(3,4,10);plot(y10)
[pks10 locs10]=findpeaks(y10);
subplot(3,4,11);plot(y11)
[pks11 locs11]=findpeaks(y11);
subplot(3,4,12),plot(y)

pks1=numel(pks1);
pks2=numel(pks2);
pks3=numel(pks3);
pks4=numel(pks4);
pks5=numel(pks5);
pks6=numel(pks6);
pks7=numel(pks7);
pks8=numel(pks8);
pks9=numel(pks9);
pks10=numel(pks10);
pks11=numel(pks11);




Picos=[pks1 pks2 pks3 pks4 pks5 pks6 pks7 pks8 pks9 pks10 pks11];

count=0;
if Picos(1)>=3
    count=count+1;
else
    count=count;
end
if Picos(2)>=3
    count=count+1;
else
    count=count;
end

if Picos(3)>=3
    count=count+1;
else
    count=count;
end
if Picos(4)>=4
    count=count+1;
else
    count=count;
end

for n=5:11;
if Picos(n)>=5
    count=count+1;
else
    count=count;
end
end
count;

%print(figura_resolucion,'fig_resolucion','-dpng')
%movefile('fig_resolucion.png','/Users/MacBookPro/Documents/MATLAB/Guide/html/')

%print(figura_curvas,'fig_curvas','-dpng')
%movefile('fig_curvas.png','/Users/MacBookPro/Documents/MATLAB/Guide/html/')


end


