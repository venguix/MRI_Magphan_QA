function [ geo_dist_SFOV,geo_dist_LFOV, matriz ] = fun_distorsion( I,pxl_sz,centro_x,centro_y )

%msg=['Place le point sur le point central du groupe Nord'];
%h=msgbox(msg,'Aide');
%uiwait(h);
%figure;
%imshow(I,[]); 
%pos=[0 0];
%[x,y]=ginput(1);
%pos(1)=x(1)-7;
%pos(2)=y(1)-7;

figura_distorsion=figure(1),
h_im=imshow(I,[]);


pos(1)=(centro_x)-7.5;
pos(2)=(centro_y)-80;
tl_cnr_N=[pos(1) pos(2)];%top-left corner of north (top) central dot
tl_cnr_N=round(tl_cnr_N);%make it int
%
%2.define rough ROIs around the other 3 central dots
phys_d_mm=141.4214;%HM
phys_d_pxl=round(phys_d_mm/pxl_sz(1,1));
tl_cnr_S=[tl_cnr_N(1) tl_cnr_N(2)+phys_d_pxl];
tl_cnr_W=round([tl_cnr_N(1)-phys_d_pxl/2 tl_cnr_N(2)+phys_d_pxl/2]);
tl_cnr_E=round([tl_cnr_N(1)+phys_d_pxl/2 tl_cnr_N(2)+phys_d_pxl/2]);
ROI_sz_mm=15;%HW
ROI_sz_pxl=round(ROI_sz_mm/pxl_sz(1,1));

%figure;
imshow(I,[]);

hold on;
plot([tl_cnr_N(1),tl_cnr_N(1)+ROI_sz_pxl,...
    tl_cnr_N(1)+ROI_sz_pxl,tl_cnr_N(1),tl_cnr_N(1)],...
    [tl_cnr_N(2),tl_cnr_N(2),tl_cnr_N(2)+ROI_sz_pxl,...
    tl_cnr_N(2)+ROI_sz_pxl,tl_cnr_N(2)],'r');hold on;
plot([tl_cnr_S(1),tl_cnr_S(1)+ROI_sz_pxl,...
    tl_cnr_S(1)+ROI_sz_pxl,tl_cnr_S(1),tl_cnr_S(1)],...
    [tl_cnr_S(2),tl_cnr_S(2),tl_cnr_S(2)+ROI_sz_pxl,...
    tl_cnr_S(2)+ROI_sz_pxl,tl_cnr_S(2)],'r');hold on;
plot([tl_cnr_W(1),tl_cnr_W(1)+ROI_sz_pxl,...
    tl_cnr_W(1)+ROI_sz_pxl,tl_cnr_W(1),tl_cnr_W(1)],...
    [tl_cnr_W(2),tl_cnr_W(2),tl_cnr_W(2)+ROI_sz_pxl,...
    tl_cnr_W(2)+ROI_sz_pxl,tl_cnr_W(2)],'r');hold on;
plot([tl_cnr_E(1),tl_cnr_E(1)+ROI_sz_pxl,...
    tl_cnr_E(1)+ROI_sz_pxl,tl_cnr_E(1),tl_cnr_E(1)],...
    [tl_cnr_E(2),tl_cnr_E(2),tl_cnr_E(2)+ROI_sz_pxl,...
    tl_cnr_E(2)+ROI_sz_pxl,tl_cnr_E(2)],'r');hold off;
%title('Initial Guess of the Central Dots Location');
%legend('Initial Guess ROI');
%
%3.find the precise location of each of 4 central dots
cen_N=fun_FindPtCoord(I,tl_cnr_N,ROI_sz_pxl);
cen_S=fun_FindPtCoord(I,tl_cnr_S,ROI_sz_pxl);
cen_W=fun_FindPtCoord(I,tl_cnr_W,ROI_sz_pxl);
cen_E=fun_FindPtCoord(I,tl_cnr_E,ROI_sz_pxl);

%
%4.calc the LFOV hori/vert distance
geo_dist_LFOV(1,1)=sqrt((cen_N(1)-cen_S(1))^2+(cen_N(2)-cen_S(2))^2);
geo_dist_LFOV(1,2)=sqrt((cen_W(1)-cen_E(1))^2+(cen_W(2)-cen_E(2))^2);
%
%5.convert to mm
geo_dist_LFOV=geo_dist_LFOV*pxl_sz(1,1)
%set(handles.text15,'String',geo_dist_LFOV);
%
%6.find the precise location of 4 surrounding dots of each pair
sz_mm=14.142-2;%HW%distance between 2 dots-2 mm
sz_pxl=round(sz_mm/pxl_sz(1,1));
cen_n=fun_Magphan_Find4DotsCen(I,cen_N,sz_pxl);
cen_s=fun_Magphan_Find4DotsCen(I,cen_S,sz_pxl);
cen_w=fun_Magphan_Find4DotsCen(I,cen_W,sz_pxl);
cen_e=fun_Magphan_Find4DotsCen(I,cen_E,sz_pxl);

%7.calc SFOV hori/vert distance
geo_dist_SFOV(1,1)=...
    sqrt((cen_n(1,1)-cen_n(2,1))^2+(cen_n(1,2)-cen_n(2,2))^2);
geo_dist_SFOV(2,1)=...
    sqrt((cen_s(1,1)-cen_s(2,1))^2+(cen_s(1,2)-cen_s(2,2))^2);
geo_dist_SFOV(3,1)=...
    sqrt((cen_w(1,1)-cen_w(2,1))^2+(cen_w(1,2)-cen_w(2,2))^2);
geo_dist_SFOV(4,1)=...
    sqrt((cen_e(1,1)-cen_e(2,1))^2+(cen_e(1,2)-cen_e(2,2))^2);
geo_dist_SFOV(1,2)=...
    sqrt((cen_n(3,1)-cen_n(4,1))^2+(cen_n(3,2)-cen_n(4,2))^2);
geo_dist_SFOV(2,2)=...
    sqrt((cen_s(3,1)-cen_s(4,1))^2+(cen_s(3,2)-cen_s(4,2))^2);
geo_dist_SFOV(3,2)=...
    sqrt((cen_w(3,1)-cen_w(4,1))^2+(cen_w(3,2)-cen_w(4,2))^2);
geo_dist_SFOV(4,2)=...
    sqrt((cen_e(3,1)-cen_e(4,1))^2+(cen_e(3,2)-cen_e(4,2))^2);
%
%8.convert to mm
geo_dist_SFOV=geo_dist_SFOV*pxl_sz(1,1)
%set(handles.text17,'String',geo_dist_SFOV);
%
%9.show the dot centroid on image
%figure;
%imshow(I,[]);
hold on;
plot(cen_N(1),cen_N(2),'+r');hold on;
for i=1:4
    plot(cen_n(i,1),cen_n(i,2),'+b');hold on;
    plot(cen_s(i,1),cen_s(i,2),'+b');hold on;
    plot(cen_w(i,1),cen_w(i,2),'+b');hold on;
    plot(cen_e(i,1),cen_e(i,2),'+b');hold on;
end
plot(cen_S(1),cen_S(2),'+r');hold on;
plot(cen_W(1),cen_W(2),'+r');hold on;
plot(cen_E(1),cen_E(2),'+r');hold off;
%title('Centroids of Dots');
%legend('Central Dots','Surrounding Dots');

%plot(cen_n(i,1),cen_n(i,2),'+b');hold on;
% Distancias
h1 = imdistline(gca,[cen_w(3,1) cen_s(2,1)],[cen_w(3,2) cen_s(2,2)]);
h2 = imdistline(gca,[cen_s(2,1) cen_e(4,1)],[cen_s(2,2) cen_e(4,2)]);
h3 = imdistline(gca,[cen_W(1) cen_S(1)],[cen_W(2) cen_S(2)]);
h4 = imdistline(gca,[cen_S(1) cen_E(1)],[cen_S(2) cen_E(2)]);
h5 = imdistline(gca,[cen_w(4,1) cen_s(1,1)],[cen_w(4,2) cen_s(1,2)]);
h6 = imdistline(gca,[cen_s(1,1) cen_e(3,1)],[cen_s(1,2) cen_e(3,2)]);
h7 = imdistline(gca,[cen_n(3,1) cen_n(1,1)],[cen_n(3,2) cen_n(1,2)]);
h8 = imdistline(gca,[cen_n(1,1) cen_n(4,1)],[cen_n(1,2) cen_n(4,2)]);

dist1 = getDistance(h1)
dist2 = getDistance(h2)
dist3 = getDistance(h3);
dist4 = getDistance(h4);
dist5 = getDistance(h5);
dist6 = getDistance(h6);
dist7 = getDistance(h7);
dist8 = getDistance(h8);

api1=iptgetapi(h1);api1.setLabelVisible(false);
api2=iptgetapi(h2);api2.setLabelVisible(false);
api3=iptgetapi(h3);api3.setLabelVisible(false);
api4=iptgetapi(h4);api4.setLabelVisible(false);
api5=iptgetapi(h5);api5.setLabelVisible(false);
api6=iptgetapi(h6);api6.setLabelVisible(false);
api7=iptgetapi(h7);api7.setLabelVisible(false);
api8=iptgetapi(h8);api8.setLabelVisible(false);

dist1cm=(dist1*pxl_sz(1))/10; %Dist1cm=round(dist1cm);
dist2cm=(dist2*pxl_sz(1)/10); %Dist2cm=round(dist2cm);
dist3cm=(dist3*pxl_sz(1))/10; %Dist3cm=round(dist3cm);
dist4cm=(dist4*pxl_sz(1))/10; %Dist4cm=round(dist4cm);
dist5cm=(dist5*pxl_sz(1))/10; %Dist5cm=round(dist5cm);
dist6cm=(dist6*pxl_sz(1))/10; %Dist6cm=round(dist6cm);
dist7cm=(dist7*pxl_sz(1))/10; %Dist7cm=round(dist7cm);
dist8cm=(dist8*pxl_sz(1))/10; %Dist8cm=round(dist8cm);


%Matriz=[Dist1cm Dist2cm Dist3cm Dist7cm; Dist4cm Dist5cm Dist6cm Dist8cm];
matriz=[dist1cm dist2cm dist3cm dist4cm; dist5cm dist6cm dist7cm dist8cm];

imtool(I,'Displayrange',[])

print(figura_distorsion,'fig_distorsion','-dpng')
%movefile('fig_distorsion.png','/Users/MacBookPro/Documents/MATLAB/Guide/html/')

end

