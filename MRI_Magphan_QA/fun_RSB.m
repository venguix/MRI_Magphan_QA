function [ int1, int2, int3, int4 ] = fun_RSB( I,centro_x,centro_y )


%Signal
        e1=imellipse(gca,[90 90 20 20]);
        e2=imellipse(gca,[90 140 20 20]);
        e3=imellipse(gca,[140 90 20 20]);
        e4=imellipse(gca,[140 140 20 20]);
        %Noise
        n1=imellipse(gca,[30 190 20 20]);
        n2=imellipse(gca,[30 30 20 20]);
        n3=imellipse(gca,[220 30 20 20]);
        n4=imellipse(gca,[220 190 20 20]);
      
        %Signal
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
        
        %Total signal
        sum_signal=(rm1+rm2+rm3+rm4)/4
        
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
        sum_noise=(((nm1+nm2+nm3+nm4)/4)/0.655)
        
        RSB=sum_signal/sum_noise;
        
        int1=num2str(RSB,'%0.2f');
end

