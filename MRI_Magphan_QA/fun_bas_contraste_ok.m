function [contar] = fun_bas_contraste_ok( I,centro_x,centro_y )

%I=dicomread('IM-0001-0028');
%h_im=imshow(I,[]);

%centro_x=127;
%centro_y=126;

%%

line1x=[centro_x-28,centro_x];
line1y=[centro_y+29,centro_y];
line2x=[centro_x+29,centro_x];
line2y=[centro_y+26,centro_y];
line3x=[centro_x+28,centro_x];
line3y=[centro_y-30,centro_y];
line4x=[centro_x-27,centro_x];
line4y=[centro_y-25,centro_y];

y1=improfile(I,line1x,line1y);
y2=improfile(I,line2x,line2y);
y3=improfile(I,line3x,line3y);
y4=improfile(I,line4x,line4y);

y1=y1(1:26);%d=23px
y2=y2(1:26);
y3=y3(1:26);
y4=y4(1:23);

%%
for n=1:size(y1)
    if y1(n)<=130
        y1(n)=0;
        n=n+1;
    else
        y1(n)=y1(n);
        n=n+1;
    end
end
   
for n=1:size(y2)
    if y2(n)<=130
        y2(n)=0;
        n=n+1;
    else
        y2(n)=y2(n);
        n=n+1;
    end
end
for n=1:size(y3)
    if y3(n)<=130
        y3(n)=0;
        n=n+1;
    else
        y3(n)=y3(n);
        n=n+1;
    end
end
for n=1:size(y4)
    if y4(n)<=130
        y4(n)=0;
        n=n+1;
    else
        y4(n)=y4(n);
        n=n+1;
    end
end
%%
for m=1:(size(y1)-1)
  if(y1(m+1)<(y1(m)-0.25*y1(m))) | (y1(m+1)>(0.25*y1(m)+y1(m)))
      y1(m+1)=y1(m+1);
      m=m+1;
  else
      y1(m+1)=y1(m);
      m=m+1;
  
  end
end
%%
for m=1:(size(y2)-1)
  if(y2(m+1)<(y2(m)-0.25*y2(m))) | (y2(m+1)>(0.25*y2(m)+y2(m)))
      y2(m+1)=y2(m+1);
      m=m+1;
  else
      y2(m+1)=y2(m);
      m=m+1;
  
  end
end
%%
for m=1:(size(y3)-1)
  if(y3(m+1)<(y3(m)-0.25*y3(m))) | (y3(m+1)>(0.25*y3(m)+y3(m)))
      y3(m+1)=y3(m+1);
      m=m+1;
  else
      y3(m+1)=y3(m);
      m=m+1;
  
  end
end
%%
for m=1:(size(y4)-1)
  if(y4(m+1)<(y4(m)-0.25*y4(m))) | (y4(m+1)>(0.25*y4(m)+y4(m)))
      y4(m+1)=y4(m+1);
      m=m+1;
  else
      y4(m+1)=y4(m);
      m=m+1;
  end
  end
%%
figura_curvas_bajo=figure(1),
subplot(2,2,1);plot(y1)
[pks1 locs1]=findpeaks(y1);
hold on
plot(locs1,pks1,'o')

subplot(2,2,2);plot(y2)
[pks2 locs2]=findpeaks(y2);
hold on
plot(locs2,pks2,'o')

subplot(2,2,3);plot(y3)
[pks3 locs3]=findpeaks(y3);
hold on
plot(locs3,pks3,'o')

subplot(2,2,4);plot(y4)
[pks4 locs4]=findpeaks(y4);
hold on
plot(locs4,pks4,'o')

%%
std1=std(y1);
std2=std(y2);
std3=std(y3);
std4=std(y4);

Ecarts=[std1 std2 std3 std4];
%%
dif1=abs(diff(pks1));
dif2=abs(diff(pks2));
dif3=abs(diff(pks3));
dif4=abs(diff(pks4));

a1=numel(pks1);
a2=numel(pks2);
a3=numel(pks3);
a4=numel(pks4);


%%
if a1(1)>=3
    count1=1;
else
    count1=0;
end


if a2(1)>=3
    count2=1;
else
    count2=0;
end

if a3(1)>=3
    count3=1;
else
    count3=0;
end


if a4(1)>=3
    count4=1;
else
    count4=0;
end


contar=count1+count2+count3+count4


%figura_bajocont=figure(2),imshow(I,[]);
imtool(I,'Displayrange',[])
%print(figura_bajocont,'fig_bajocont','-dpng')
%movefile('fig_bajocont.png','/Users/MacBookPro/Documents/MATLAB/Guide/html/')

%print(figura_curvas_bajo,'fig_curvas_bajo','-dpng')
%movefile('fig_curvas_bajo.png','/Users/MacBookPro/Documents/MATLAB/Guide/html/')

end


