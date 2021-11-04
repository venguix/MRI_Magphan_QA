%function [HCSR]=fun_Magphan_3_HCSR(I,pxl_sz)
% This function performs the contrast test on Magphan. It use the bottom
% phantom boundary to define the phantom centre y-coord because sometime
% air bubble will affect the phantom centre definition.
%
% Input:
%   I: 2D image
%   pxl_sz: pixel size (2-by-1 vetor)
%   auto: auto sample line profile across pattern (1:auto, 0:manual)
% Output:
%   HCSR: the number of lp can be visually distinguished
% Usage: 
%   
% HW: (search for HW)
%   
% Naughty Boy: (search for NB)
% Author: Jidi Sun
% Email: jidi.sun@uon.edu.au
% Version: v1 (07/02/15)
%          v2 ()(search for v2)
% History: v1
%          v2 
% Copyright: please see license.txt
% Acknowledgement: My study is funded by the Cancer Council NSW, Australia,
%                  project grant RG11-05. PhD under the University of 
%                  Newcastle and the Calvary Mater Newcastle Hospital 
%                  provides me the office and the MR scanner to work with.

%I=dicomread('IM-0001-0030');
I=dicomread('MAGPHAN.MR.QA_WEEKLY.0010.0029.2015.02.17.11.57.17.111091.91301718');
figure(1),imshow(I,[]);
info=dicominfo('MAGPHAN.MR.QA_WEEKLY.0010.0029.2015.02.17.11.57.17.111091.91301718');
pxl_sz=getfield(info,'PixelSpacing');
%%
     %1.detect phantom edge
     BW_edge=edge(I,'canny');
     %2.fill the phantom
     BW_fill=imfill(BW_edge,'hole');
     %3.find the phantom centre and radius
     % [phant_cen,phant_rad]=imfindcircles(BW_fill,[0 100]);%V2014
     dummy_x=sum(BW_fill,1);
     [~,left_x]=find(dummy_x,1,'first');
     [~,right_x]=find(dummy_x,1,'last');
     dummy_y=sum(BW_fill,2);
     [btm_y,~]=find(dummy_y,1,'last');
     cen_x=round(abs(left_x-right_x)/2+min([left_x,right_x]));
     % cen_y_maybe=round(abs(top_y-btm_y)/2+min([top_y,btm_y]));
     % if abs(abs(top_y-btm_y)-abs(left_x-right_x))>=2
     %     disp('The horizontal & vertical diameter is larger than 2 pixels.');
     %     disp('This may due to the air bubble at the phantom anterior region.');%     %     disp('Place check the Contrast Test image slice.');
     %     disp('If no air bubble, then the image is insymetrically distorted.');
     % end
     cen_y_phys=btm_y-round(96.2/pxl_sz(1,1))+1;%HW
     cen=[cen_x;cen_y_phys];
     %%
     %4.verify phantom centre based on central bright spot
     hori_sum=sum(I(cen_y_phys-5:cen_y_phys+5,cen_x-5:cen_x+5),1);%sum +/-5 pxl square horiontally
     vert_sum=sum(I(cen_y_phys-5:cen_y_phys+5,cen_x-5:cen_x+5),2);%sum +/-5 pxl square vertically
     hori_pk=peakfinder(hori_sum);%peak is centre
     vert_pk=peakfinder(vert_sum);
     cen_verif=cen+[hori_pk;vert_pk]-6;%if centre is at 6th pxl,then there's no change
     figure;
     imshow(I,[]);hold on;
     plot(cen(1,1),cen(2,1),'r+',cen_verif(1,1),cen_verif(2,1),'b+');hold off;
     legend('Physically Predicted Centre','Verified Centre');
     %%
     %5.define the rough centre of the 2nd slit from bottom & 3rd from right
     cen_2nd_btm=cen_verif+round([-29.3;30.27]/pxl_sz(1,1));
     cen_3rd_right=cen_verif+round([2.93;-32.23]/pxl_sz(1,1));
     %%
     %6.define vertical sampling range & sum several vertical profiles
     vert_start=cen_3rd_right(2,1);%start from hori central line
     vert_end=cen_verif(2,1)+round(43.95/pxl_sz(1,1));
     hori_start=cen_2nd_btm(1,1)-round(3.91/pxl_sz(1,1));
     hori_end=cen_2nd_btm(1,1)+round(3.91/pxl_sz(1,1));
     vert_prof=sum(I(vert_start:vert_end,hori_start:hori_end),2);
     vert_prof=vert_prof/(round(3.91/pxl_sz(1,1))*2+1);%calc average value
     figure;plot(vert_prof);
     %7.define horizontal sampling range & sum several horizontal profile
    vert_start=cen_3rd_right(2,1)-round(3.91/pxl_sz(1,1));
     vert_end=cen_3rd_right(2,1)+round(3.91/pxl_sz(1,1));
     hori_start=cen_2nd_btm(1,1);%start from vert central line
     % hori_start=cen_verif(1,1)-round(25.39/pxl_sz(1,1));
     hori_end=cen_verif(1,1)+round(42.97/pxl_sz(1,1));
     hori_prof=sum(I(vert_start:vert_end,hori_start:hori_end),1);
     hori_prof=hori_prof/(round(3.91/pxl_sz(1,1))*2+1);%calc average value
     figure;plot(hori_prof);
%end
 %%
 %8.normalise profile to minimise intensity inhomogeneity
 [p,~,mu]=polyfit((1:numel(vert_prof))',vert_prof,5);
 f_y=polyval(p,(1:numel(vert_prof))',[],mu);
 vert_prof_norm=vert_prof-f_y;
 [p,~,mu]=polyfit((1:numel(hori_prof)),hori_prof,5);
 f_y=polyval(p,(1:numel(hori_prof)),[],mu);
 hori_prof_norm=hori_prof-f_y;
 vert_prof_norm=vert_prof_norm+abs(min(vert_prof_norm));
 hori_prof_norm=hori_prof_norm+abs(min(hori_prof_norm));
 figure;
 subplot(1,2,1);
 plot(vert_prof,'r');hold on;
 plot(vert_prof_norm,'b');hold off;
 legend('Original Profile','Normalised Profile');
 title('Vertical Profile');
 subplot(1,2,2);
 plot(hori_prof,'r');hold on;
 plot(hori_prof_norm,'b');hold off;
 legend('Original Profile','Normalised Profile');
 title('Horizontal Profile');
 %%
 %8.use 2nd deg regression to smooth normalised profile
 x=1:1:length(vert_prof_norm);
 vert_prof_norm_smth=smooth(x,vert_prof_norm,0.1,'loess');
 vert_prof_norm_smth1=smooth(x,vert_prof_norm_smth,0.1,'loess');
 %%
 %9.find edges of vertical arranged slits
 [pkloc_vert_norm_smth,pk_vert_norm_smth]=peakfinder...
     (abs(diff(vert_prof_norm_smth1)));
 x=1:1:length(vert_prof_norm_smth);
 vert_edge=x(pkloc_vert_norm_smth);
 figure;
 subplot(2,1,1);
 plot(x,vert_prof_norm,'b',x,vert_prof_norm_smth,'r',x,vert_prof_norm_smth1,'g');
 legend('vertzontal Normalised Profile','Smoothed Porfile','Smooth fo Smoothed Profile');
 title('Normalised vs. Smoothed Profile');
 subplot(2,1,2);
 plot(abs(diff(vert_prof_norm_smth1)),'b');hold on;
 plot(vert_edge,pk_vert_norm_smth,'or');hold off;
 legend('1st Derivative','Peaks (Slit Edge)');
 title('Slits Edges');
 %%
 %10.find MTF of vertical arranged slit array

 lp_vert=zeros(1,4);
 if length(vert_edge)~=16
     disp('The slit number found is not 16.');
     dummy=abs(diff(pkloc_vert_norm_smth));
     if dummy(1,1)<dummy(2,1)
         pkloc_vert_norm_smth_real=pkloc_vert_norm_smth(2:17,1);
     else
        pkloc_vert_norm_smth_real=pkloc_vert_norm_smth(1:16,1);
     end
 else
     pkloc_vert_norm_smth_real=pkloc_vert_norm_smth;
 end
 lp_vert(1,1)=(max(vert_prof_norm(pkloc_vert_norm_smth_real(1):...
     pkloc_vert_norm_smth_real(2)))-...
     min(vert_prof_norm(pkloc_vert_norm_smth_real(1):...
     pkloc_vert_norm_smth_real(2))))/...
     (max(vert_prof_norm(pkloc_vert_norm_smth_real(1):...
     pkloc_vert_norm_smth_real(2)))+...
     min(vert_prof_norm(pkloc_vert_norm_smth_real(1):...
     pkloc_vert_norm_smth_real(2))));
 lp_vert(1,2)=(max(vert_prof_norm(pkloc_vert_norm_smth_real(3):...
     pkloc_vert_norm_smth_real(4)))-...
     min(vert_prof_norm(pkloc_vert_norm_smth_real(3):...
     pkloc_vert_norm_smth_real(4))))/...
     (max(vert_prof_norm(pkloc_vert_norm_smth_real(3):...
     pkloc_vert_norm_smth_real(4)))+...
     min(vert_prof_norm(pkloc_vert_norm_smth_real(3):...
     pkloc_vert_norm_smth_real(4))));
 lp_vert(1,3)=(max(vert_prof_norm(pkloc_vert_norm_smth_real(5):...
     pkloc_vert_norm_smth_real(10)))-...
     min(vert_prof_norm(pkloc_vert_norm_smth_real(5):...
     pkloc_vert_norm_smth_real(10))))/...
     (max(vert_prof_norm(pkloc_vert_norm_smth_real(5):...
     pkloc_vert_norm_smth_real(10)))+...
     min(vert_prof_norm(pkloc_vert_norm_smth_real(5):...
     pkloc_vert_norm_smth_real(10))));
 lp_vert(1,4)=(max(vert_prof_norm(pkloc_vert_norm_smth_real(11):...
     pkloc_vert_norm_smth_real(16)))-...
     min(vert_prof_norm(pkloc_vert_norm_smth_real(11):...
     pkloc_vert_norm_smth_real(16))))/...
     (max(vert_prof_norm(pkloc_vert_norm_smth_real(11):...
     pkloc_vert_norm_smth_real(16)))+...
     min(vert_prof_norm(pkloc_vert_norm_smth_real(11):...
     pkloc_vert_norm_smth_real(16))));
 %% ______________________
 p_vert=zeros(1,4);
 cnt=1;
 if length(vert_edge)~=16
     disp('The slit number found is not 16.');
 else
     for j=1:2:length(vert_edge)
         dummy=vert_prof_norm(vert_edge(1,j):vert_edge(1,j+1));%individual slit only
         [loc,~]=peakfinder(dummy);
         if length(loc)>1
             dummy1=dummy(loc(1,1):loc(1,end));
             lp_vert(1,cnt)=(max(dummy1)-min(dummy1))/...
                 (max(dummy1)+min(dummy1));
             cnt=cnt+1;
         elseif length(loc)==1 && loc<=length(dummy)/2
             dummy1=dummy(loc:loc+1);
             lp_vert(1,cnt)=(max(dummy1)-min(dummy1))/...
                 (max(dummy1)+min(dummy1));
             cnt=cnt+1;
         elseif length(loc)==1 && loc>length(dummy)/2
             dummy1=dummy(loc-1:loc);
             lp_vert(1,cnt)=(max(dummy1)-min(dummy1))/...
                 (max(dummy1)+min(dummy1));
             cnt=cnt+1;
         end
     end
 end
 %% _______________
 %%
 %11.use 2nd deg regression to smooth normalised profile
 x=1:1:length(hori_prof_norm);
 hori_prof_norm_smth=smooth(x,hori_prof_norm,0.1,'loess');
 hori_prof_norm_smth1=smooth(x,hori_prof_norm_smth,0.1,'loess');
 %%
 %12.find edges of horizotnal arranged slits
 [pkloc_hori_norm_smth,pk_hori_norm_smth]=peakfinder...
     (abs(diff(hori_prof_norm_smth1)));
 x=1:1:length(hori_prof_norm_smth);
 hori_edge=x(pkloc_hori_norm_smth);
 figure;
 subplot(2,1,1);
 plot(x,hori_prof_norm,'b',x,hori_prof_norm_smth,'r',x,hori_prof_norm_smth1,'g');
 legend('Horizontal Normalised Profile','Smoothed Porfile','Smooth fo Smoothed Profile');
 title('Normalised vs. Smoothed Profile');
 subplot(2,1,2);
 plot(abs(diff(hori_prof_norm_smth1)),'b');hold on;
 plot(hori_edge,pk_hori_norm_smth,'or');hold off;
 legend('1st Derivative','Peaks (Slit Edge)');
 title('Slits Edges');
 %%
 %13.find MTF of horizontal arranged slit array
 lp_hori=zeros(1,7);
 cnt=1;
 if length(hori_edge)~=14
     disp('The slit number found is not 14.');
 else
     for j=1:2:length(hori_edge)
         dummy=hori_prof_norm(hori_edge(1,j):hori_edge(1,j+1));%individual slit only
         [loc,~]=peakfinder(dummy);
         if length(loc)>1
             dummy1=dummy(loc(1,1):loc(1,end));
             lp_hori(1,cnt)=(max(dummy1)-min(dummy1))/...
                 (max(dummy1)+min(dummy1));
             cnt=cnt+1;
         elseif length(loc)==1 && loc<=length(dummy)/2
             dummy1=dummy(loc:loc+1);
             lp_hori(1,cnt)=(max(dummy1)-min(dummy1))/...
                 (max(dummy1)+min(dummy1));
             cnt=cnt+1;
         elseif length(loc)==1 && loc>length(dummy)/2
             dummy1=dummy(loc-1:loc);
             lp_hori(1,cnt)=(max(dummy1)-min(dummy1))/...
                 (max(dummy1)+min(dummy1));
             cnt=cnt+1;
         end
     end
 end
 %%
 %14.combine line pairs
 lp=cat(2,flip(lp_vert,2),lp_hori);%vertical one needs to be reversed
 figure;
 plot(lp,'+-');
 %15.interpolate MTF curve (maybe fit MTF to the curve instead)
 x=1:1:length(lp);
 xx=1:0.0001:length(lp);
 lp_interp=interp1(x,lp,xx,'spline');
 figure;
 plot(x,lp,'o',xx,lp_interp,'-.');
 %16.fit MTF formula to data
 %17.find 50% MTF
 dummy=find(lp_interp>0.5);
 MTF_50=size(dummy,2)/10000+1;
 dummy=find(lp_interp>0.2);
 MTF_20=size(dummy,2)/10000+1;
 %i)interpolate the curve to increase curve resolution
 %j)find 50%, 20% & 10% MTF spatial resolution
 %end