function [ centro ] = fun_centro( I,pxl_sz )

%I=dicomread('IM-0001-0030');
%figure(1),imshow(I,[]);
%info=dicominfo('MAGPHAN.MR.QA_WEEKLY.0012.0074.2015.02.17.11.57.17.111091.91306094');
%pxl_sz=getfield(info,'PixelSpacing');

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
     cen=[cen_x;cen_y_phys];% SE LLAMABA cen Y NO CENTRO
     %
     %4.verify phantom centre based on central bright spot
     hori_sum=sum(I(cen_y_phys-5:cen_y_phys+5,cen_x-5:cen_x+5),1);%sum +/-5 pxl square horiontally
     vert_sum=sum(I(cen_y_phys-5:cen_y_phys+5,cen_x-5:cen_x+5),2);%sum +/-5 pxl square vertically
     hori_pk=peakfinder(hori_sum);%peak is centre
     vert_pk=peakfinder(vert_sum);
     cen_verif=cen+[hori_pk;vert_pk]-6;%if centre is at 6th pxl,then there's no change
     %figure;
     %imshow(I,[]);
     hold on;
     %plot(cen(1,1),cen(2,1),'r+',cen_verif(1,1),cen_verif(2,1),'b+');
     plot(cen_verif(1,1),cen_verif(2,1),'b+');
     hold off;
     %legend('Physically Predicted Centre','Verified Centre');
     centro=cen_verif;
end

