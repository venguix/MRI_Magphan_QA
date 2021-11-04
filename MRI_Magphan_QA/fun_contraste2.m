function [ int1, int2, int3, int4 ] = fun_contraste2(I,centro_x,centro_y)

figura_contraste=figure(1),
h_im=imshow(I,[]);

e1=imellipse(gca,[(centro_x)-30 (centro_y)-5 10 10]);
e2=imellipse(gca,[(centro_x)+21 (centro_y)-5 10 10]);
e3=imellipse(gca,[(centro_x)-5 (centro_y)+20 10 10]);
e4=imellipse(gca,[(centro_x)-5 (centro_y)-30 10 10]);

        %ROI1
        rmsk1=e1.createMask;
        rn1=sum(rmsk1(:));
        rm1=mean(I(rmsk1));
        %ROI2
        rmsk2=e2.createMask;
        rn2=sum(rmsk2(:));
        rm2=mean(I(rmsk2));
        %ROI3
        rmsk3=e3.createMask;
        rn3=sum(rmsk3(:));
        rm3=mean(I(rmsk3));
        %ROI4
        rmsk4=e4.createMask;
        rn4=sum(rmsk4(:));
        rm4=mean(I(rmsk4));
        
        %int1=num2str(rm1,'Intensity 1: %0.2f');
        int1=num2str(rm1,'%0.1f');
        int2=num2str(rm2,'%0.1f');
        int3=num2str(rm3,'%0.1f');
        int4=num2str(rm4,'%0.1f');
        
        imtool(I,'Displayrange',[])
        
        print(figura_contraste,'fig_contraste','-dpng')
        %movefile('fig_contraste.png','/Users/MacBookPro/Documents/MATLAB/Guide/html/')
        

end

