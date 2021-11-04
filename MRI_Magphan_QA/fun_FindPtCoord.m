function [cen_fn]=fun_FindPtCoord(I,tl_cnr_coord,width,height)
% This function finds the precise coordinate of the point on an image. It
% assumes the single point source in the ROI. The output is the coord on 
% the original image (global).
%
% NOTE: If height input is not presented, then the code assumes a square
%       ROI.
%
% Input:
%   I: 2D image
%   tl_cnr_coord: top-left corner coord of the ROI [xmin ymin]
%   width: width of ROI
%   height: height of ROI
% Output:
%   cen_fn: fine (precise) coord of centroid of point source [x y]
% Usage: 
%   
% HW: (search for HW)
%   1. 
% Naughty Boy: (search for NB)
% Author: Jidi Sun
% Email: jidi.sun@uon.edu.au
% Version: v.1 (06/02/15)
%          v.2 ()(search for v2)
% History: v.1
%          v.2 
% Copyright: please see license.txt
% Acknowledgement: My study is funded by the Cancer Council NSW, Australia,
%                  project grant RG11-05. PhD under the University of 
%                  Newcastle and the Calvary Mater Newcastle Hospital 
%                  provides me the office and the MR scanner to work with.

%1.check existence of height input
if ~exist('height','var')
    height=width;
    disp('You are creating a square ROI.');
end
%2.focus on the ROI
I_ROI=I(tl_cnr_coord(2):tl_cnr_coord(2)+height,...
    tl_cnr_coord(1):tl_cnr_coord(1)+width);
%3.sum 2 directions
hori_sum=sum(I_ROI,1);
vert_sum=sum(I_ROI,2);
%4.fit Gaussian to data (with higher precision)
x=1:length(hori_sum);%hori summation
f=fit(x',hori_sum','gauss1');
a1=f.a1;
b1=f.b1;
c1=f.c1;
xx=1:1e-3:length(hori_sum);%set higher precision
hori_sum_G=a1*exp(-((xx-b1)/c1).^2);
x=1:length(vert_sum);%vert summation
f=fit(x',vert_sum,'gauss1');
a1=f.a1;
b1=f.b1;
c1=f.c1;
xx=1:1e-3:length(vert_sum);%set higher precision
vert_sum_G=a1*exp(-((xx-b1)/c1).^2);
%5.find curve peak
[~,loc_hori]=findpeaks(hori_sum_G,'MINPEAKHEIGHT',max(hori_sum_G)/2);
[~,loc_vert]=findpeaks(vert_sum_G,'MINPEAKHEIGHT',max(vert_sum_G)/2);
%6.convert to global coord
cen_fn(1,1)=tl_cnr_coord(1)+loc_hori*1e-3;
cen_fn(1,2)=tl_cnr_coord(2)+loc_vert*1e-3;
end