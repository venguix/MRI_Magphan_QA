function [ RSB ] = fun_RSB_dB( I,centro_x,centro_y )
%NO ESTAMOS UTILIZANDO LAS ROIS EXTERIORES, INT Y RUIDO EN LA CENTRAL
%En dB

        
       e11=imellipse(gca,[90 90 70 70]);
        

        rmsk11=e11.createMask;
        rn11=sum(rmsk11(:));
        signal=mean(I(rmsk11))
        noise=std2(I(rmsk11))
       
      
        
        %RSB=rm11/noise_total;
        RSB=20*log(signal/noise);
        
        int1=num2str(RSB,'%0.2f');



end

