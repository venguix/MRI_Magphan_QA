function [cen_fn]=fun_Magphan_Find4DotsCen(I,cen,sz)
% This function finds the precise coord of the 4 dots surrounding the
% central dot for geometric distortion test. The ROI created around each
% dot has a size of distance between 2 dots.
%
% Input:
%   I: 2D image
%   cen: coord of central dot [x y]
%   sz: distance between 2 dots
% Output:
%   cen_fn: fine (precise) coord of centroid of point source [x y], each
%           row represents [N;S;W;E]
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

%1.define top left corner coord of each dot
width=sz/2;
tl_cnr_N=[cen(1)-width cen(2)-3*width];
tl_cnr_S=[cen(1)-width cen(2)+width];
tl_cnr_W=[cen(1)-3*width cen(2)-width];
tl_cnr_E=[cen(1)+width cen(2)-width];
%2.convert to int
tl_cnr_N=round(tl_cnr_N);
tl_cnr_S=round(tl_cnr_S);
tl_cnr_W=round(tl_cnr_W);
tl_cnr_E=round(tl_cnr_E);
%2.find coord of each dot
cen_N=fun_FindPtCoord(I,tl_cnr_N,width*2);
cen_S=fun_FindPtCoord(I,tl_cnr_S,width*2);
cen_W=fun_FindPtCoord(I,tl_cnr_W,width*2);
cen_E=fun_FindPtCoord(I,tl_cnr_E,width*2);
cen_fn=cat(1,cen_N,cen_S,cen_W,cen_E);
end