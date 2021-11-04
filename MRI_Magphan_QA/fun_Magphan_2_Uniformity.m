function [PIU,mu,cen,sig]=fun_Magphan_2_Uniformity(I,pxl_sz)
% This function performs the uniformity test on Magphan.
%
% Input:
%   I: 2D image
%   pxl_sz: pixel size (2-by-1 vetor)
% Output:
%   PIU: percentage intensity uniformity
%   mu: mean intensity (will be used for ghosting calc)
%   cen: centre coord of the phantom (2-by-1 vec,[x;y])
%   sig: intensity std (will be used for zeroing line profile)
% Usage: 
%   [PIU]=fun_CTP600_486_Uniformity(I,pxl_sz);
% HW: (search for HW)
%   When searching the phantom centre from the phantom bottom, the phantom
%       radius is assumed with a physical size of 96.2 mm.
%   The ROI is 36*2 mm size square ROI.
% Naughty Boy: (search for NB)
% Author: Jidi Sun
% Email: jidi.sun@uon.edu.au
% Version: v.1 (09/12/14)
%          v.2 ()(search for v2)
% History: v.1
%          v.2 
% Copyright: please see license.txt
% Acknowledgement: My study is funded by the Cancer Council NSW, Australia,
%                  project grant RG11-05. PhD under the University of 
%                  Newcastle and the Calvary Mater Newcastle Hospital 
%                  provides me the office and the MR scanner to work with.

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
[top_y,~]=find(dummy_y,1,'first');
[btm_y,~]=find(dummy_y,1,'last');
cen_x=round(abs(left_x-right_x)/2+min([left_x,right_x]));
cen_y_phys=btm_y-round(96.2/pxl_sz(1,1))+1;%HW
cen=[cen_x;cen_y_phys];
%4.take a square ROI around phantom centre
I_mask=ones(size(I,1),size(I,2));
expand_pxl=round(36/pxl_sz(1,1));
for i=1:cen_y_phys-expand_pxl
    I_mask(i,:)=0;
end
for i=cen_y_phys+expand_pxl:size(I_mask,1)
    I_mask(i,:)=0;
end
for j=1:cen_x-expand_pxl
    I_mask(:,j)=0;
end
for j=cen_x+expand_pxl:size(I_mask,2)
    I_mask(:,j)=0;
end
I_mask=logical(I_mask);
ROI_masked=I(I_mask);
[mu,sig]=normfit(ROI_masked);
max_intensity=mu+2*sig;%2*std from mu
min_intensity=mu-2*sig;%2*std from mu
PIU=1-(max_intensity-min_intensity)/(max_intensity+min_intensity);
end