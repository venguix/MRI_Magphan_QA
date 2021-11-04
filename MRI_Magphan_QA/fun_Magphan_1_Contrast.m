function [mu,sig]=fun_Magphan_1_Contrast(I,pxl_sz)
% This function performs the contrast test on Magphan. It use the bottom
% phantom boundary to define the phantom centre y-coord because sometime
% air bubble will affect the phantom centre definition.
%
% Input:
%   I: 2D image
%   pxl_sz: pixel size (2-by-1 vetor)
% Output:
%   mu: ROI mu ([north;south;west;east;centre])
%   sig: ROI std ([north;south;west;east;centre])
% Usage: 
%   [img_unif]=fun_CTP600_486_Uniformity(I);
% HW: (search for HW)
%   When searching the phantom centre from the phantom bottom, the phantom
%       radius is assumed with a physical size of 96.2 mm.
%   The ROI radius in vial is 4.9 mm.
%   The phantom centre is masked by a 39.1*2 mm size square.
% Naughty Boy: (search for NB)
% Author: Jidi Sun
% Email: jidi.sun@uon.edu.au
% Version: v1 (09/12/14)
%          v2 (17/02/15)(search for v2)
% History: v1
%          v2 Add ROI at centre of phantom to sample the filling material
%             intensity.
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
% cen_y_maybe=round(abs(top_y-btm_y)/2+min([top_y,btm_y]));
% if abs(abs(top_y-btm_y)-abs(left_x-right_x))>=2
%     disp('The horizontal & vertical diameter is larger than 2 pixels.');
%     disp('This may due to the air bubble at the phantom anterior region.');
%     disp('Place check the Contrast Test image slice.');
%     disp('If no air bubble, then the image is insymetrically distorted.');
% end
cen_y_phys=btm_y-round(96.2/pxl_sz(1,1))+1;%HW
cen=[cen_x;cen_y_phys];
%4.create ROI in the 4 vails
roi_sz=round(4.9/pxl_sz(1,1));%HW
expand_pxl=round(39.1/pxl_sz(1,1));%HW
BW_edge_roi=BW_edge;
for i=1:cen_y_phys-expand_pxl
    BW_edge_roi(i,:)=0;
end
for i=cen_y_phys+expand_pxl:size(BW_edge_roi,1)
    BW_edge_roi(i,:)=0;
end
for j=1:cen_x-expand_pxl
    BW_edge_roi(:,j)=0;
end
for j=cen_x+expand_pxl:size(BW_edge_roi,2)
    BW_edge_roi(:,j)=0;
end
BW_edge_roi_filled=imfill(BW_edge_roi,'hole');%fill vials
BW_cen_filter=bwmorph(BW_edge_roi_filled,'open');%ignore noise due to Gibb's artefact
ROI_cen_struct=regionprops(BW_cen_filter,'Centroid');
[x_west,y_west,mu_west,sig_west]=fun_Magphan_CreateVialROI...
    (I,ROI_cen_struct(1,1).Centroid,roi_sz);
[x_north,y_north,mu_north,sig_north]=fun_Magphan_CreateVialROI...
    (I,ROI_cen_struct(2,1).Centroid,roi_sz);
[x_south,y_south,mu_south,sig_south]=fun_Magphan_CreateVialROI...
    (I,ROI_cen_struct(3,1).Centroid,roi_sz);
[x_east,y_east,mu_east,sig_east]=fun_Magphan_CreateVialROI...
    (I,ROI_cen_struct(4,1).Centroid,roi_sz);
[x_cen,y_cen,mu_cen,sig_cen]=fun_Magphan_CreateVialROI...
    (I,cen',roi_sz);%v2
figure;
imshow(I,[]);hold on;
plot(x_north,y_north,'r');hold on;
plot(x_west,y_west,'r');hold on;
plot(x_east,y_east,'r');hold on;
plot(x_south,y_south,'r');hold on;
plot(x_cen,y_cen);hold off;
legend('ROIs');
%4.output the result
mu=[mu_north;mu_south;mu_west;mu_east;mu_cen];
sig=[sig_north;sig_south;sig_west;sig_east;sig_cen];
end