function [ RSB ] = fun_RSB2( I,centro_x,centro_y )

%Signal
figura_RSB=figure(1),imshow(I,[]);


        %e11=imellipse(gca,[(centro_x)-85 (centro_y)-85 170 170]);
       e11=imellipse(gca,[(centro_x)-65 (centro_y)-65 130 130]);
       %e11=imellipse(gca,[90 90 70 70]);
        %Noise
        
        n1=imellipse(gca,[(centro_x)-115 (centro_y)+80 35 35]);
        n2=imellipse(gca,[(centro_x)-115 (centro_y)-110 35 35]);
        n3=imellipse(gca,[(centro_x)+80 (centro_y)-110 35 35]);
        n4=imellipse(gca,[(centro_x)+80 (centro_y)+80 35 35]);
        
        %n1=imellipse(gca,[30 190 20 20]);
        %n2=imellipse(gca,[30 30 20 20]);
        %n3=imellipse(gca,[220 30 20 20]);
        %n4=imellipse(gca,[220 190 20 20]);
      
        %Signal
        %ROI1
        rmsk11=e11.createMask;
        rn11=sum(rmsk11(:));
        rm11=mean(I(rmsk11))
        nm11=std2(I(rmsk11))
       
        
        %Noise
        %ROI1
        nmsk1=n1.createMask;
        nn1=sum(nmsk1(:));
        nm1=std2(I(nmsk1));
        %ROI2
        nmsk2=n2.createMask;
        nn2=sum(nmsk2(:));
        nm2=std2(I(nmsk2));
        %ROI3
        nmsk3=n3.createMask;
        nn3=sum(nmsk3(:));
        nm3=std2(I(nmsk3));
        %ROI4
        nmsk4=n4.createMask;
        nn4=sum(nmsk4(:));
        nm4=std2(I(nmsk4));
        
        %Total noise
        %sum_noise=(((nm1+nm2+nm3+nm4)/4)/0.655)%(4-pi)/2
        %noise_total=std2((I(nmsk1))+(I(nmsk2))+(I(nmsk3))+(I(nmsk4)))/0.655
        %noise_total=((std2(I(nmsk1))+std2(I(nmsk2))+std2(I(nmsk3))+std2(I(nmsk4)))/4)/0.655
        noise_total=((nm1+nm2+nm3+nm4)/4);
        noise_total=noise_total/0.65;
        
        
        RSB=rm11/(noise_total);
        %RSB=rm11/(nm11/0.655);
        
        int1=num2str(RSB,'%0.2f');
     
        imtool(I,'Displayrange',[]) 
        
        print(figura_RSB,'fig_RSB','-dpng')
       % movefile('fig_RSB.png','/Users/MacBookPro/Documents/MATLAB/Guide/html/')
        


end

