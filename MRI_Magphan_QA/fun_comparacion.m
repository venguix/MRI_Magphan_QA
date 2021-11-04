function [ test_espesor,test_uniformidad,DistorsionL,DistorsionR,Comparacion_RSB,comparacion_RB,comparacion_RS ] = fun_comparacion( tabla,slice,sensitometrie,ep_coupe,rsb,piu,distorsion,rs,bc )


rs
bc

%Espesor de corte
ep_coupe=ep_coupe/100;
espesor=tabla(1,3);
espesor=cell2mat(espesor);
espesor=str2double(espesor);
espesor_max=slice+(slice*ep_coupe);
espesor_min=slice-(slice*ep_coupe);
%espesor_max=2.3;
%espesor_min=1.7;


if ((espesor_max>espesor)&&(espesor>espesor_min))
    test_espesor1=1;
else
    test_espesor1=0;
end

if test_espesor1>=1
    test_espesor1=num2str('ok');
    
else
    test_espesor1=num2str('Non'); 
end


  
test_espesor={test_espesor1;[];[];[]};




%Uniformité
uniformidad=tabla(1,7);
uniformidad=cell2mat(uniformidad)
uniformidad=str2double(uniformidad);

if uniformidad>=piu
    test_uniformidad1=1;
else
    test_uniformidad1=0;
end

if test_uniformidad1>=1
    test_uniformidad1=num2str('ok');  
else
    test_uniformidad1=num2str('Non'); 
end

test_uniformidad={test_uniformidad1;[];[];[]};


%Distorsion L R
distL1=tabla(1,9);%distancia
distL1=cell2mat(distL1);
distL1=str2double(distL1);

distL2=tabla(2,9);
distL2=cell2mat(distL2);
distL2=str2double(distL2);

distL3=tabla(3,9);
distL3=cell2mat(distL3);
distL3=str2double(distL3);

distL4=tabla(4,9);
distL4=cell2mat(distL4);
distL4=str2double(distL4);

distR1=tabla(1,11);
distR1=cell2mat(distR1);
distR1=str2double(distR1);

distR2=tabla(2,11);
distR2=cell2mat(distR2);
distR2=str2double(distR2);

distR3=tabla(3,11);
distR3=cell2mat(distR3);
distR3=str2double(distR3);

distR4=tabla(4,11);
distR4=cell2mat(distR4);
distR4=str2double(distR4);
distorsion=distorsion/10;

D12_max=12+distorsion+0.1;
D12_min=12-distorsion-0.1;

D10_max=10+distorsion+0.1;
D10_min=10-distorsion-0.1;

D8_max=8+distorsion+0.1;
D8_min=8-distorsion-0.1;;

D2_max=2+distorsion+0.1;
D2_min=2-distorsion-0.1;;

if ((D12_max>distL1)&&(distL1>D12_min))
    distorsionL1=1;
else
    distorsionL1=0;
end

if ((D12_max>distR1)&&(distR1>D12_min))
    distorsionR1=1;
else
    distorsionR1=0;
end

if ((D10_max>distL2)&&(distL2>D10_min))
    distorsionL2=1;
else
    distorsionL2=0;
end

if ((D10_max>distR2)&&(distR2>D10_min))
    distorsionR2=1;
else
    distorsionR2=0;
end

if ((D8_max>distL3)&&(distL3>D8_min))
    distorsionL3=1;
else
    distorsionL3=0;
end

if ((D8_max>distR3)&&(distR3>D8_min))
    distorsionR3=1;
else
    distorsionR3=0;
end

if ((D2_max>distL4)&&(distL4>D2_min))
    distorsionL4=1;
else
    distorsionL4=0;
end

if ((D2_max>distR4)&&(distR4>D2_min))
    distorsionR4=1;
else
    distorsionR4=0;
end


if distorsionL1>=1
    distorsionL1=num2str('ok');  
else
    distorsionL1=num2str('Non'); 
end

if distorsionL2>=1
    distorsionL2=num2str('ok');  
else
    distorsionL2=num2str('Non'); 
end

if distorsionL3>=1
    distorsionL3=num2str('ok');  
else
    distorsionL3=num2str('Non'); 
end

if distorsionL4>=1
    distorsionL4=num2str('ok');  
else
    distorsionL4=num2str('Non'); 
end

if distorsionR1>=1
    distorsionR1=num2str('ok');  
else
    distorsionR1=num2str('Non'); 
end

if distorsionR2>=1
    distorsionR2=num2str('ok');  
else
    distorsionR2=num2str('Non'); 
end

if distorsionR3>=1
    distorsionR3=num2str('ok');  
else
    distorsionR3=num2str('Non'); 
end

if distorsionR4>=1
    distorsionR4=num2str('ok');  
else
    distorsionR4=num2str('Non'); 
end


   DistorsionL={distorsionL1;distorsionL2;distorsionL3;distorsionL4}; 
   DistorsionR={distorsionR1;distorsionR2;distorsionR3;distorsionR4};
   
%RSB
RSB1=tabla(1,5);
RSB1=cell2mat(RSB1);
RSB1=str2double(RSB1);

RSB2=tabla(2,5);
RSB2=cell2mat(RSB2);
RSB2=str2double(RSB2);
rsb=rsb/100;

RSB_max=(RSB1+(RSB1*rsb));
RSB_min=(RSB1-(RSB1*rsb));

if ((RSB_max>RSB2)&&(RSB2>RSB_min))
    comparacion_RSB=1;
else
    comparacion_RSB=0;
end


if comparacion_RSB>=1
    comparacion_RSB=num2str('ok');  
else
    comparacion_RSB=num2str('Non'); 
end

Comparacion_RSB={comparacion_RSB;[];[];[]};



%Resolution spatiale
RS1=tabla(1,13);
RS1=cell2mat(RS1);
RS1=str2double(RS1);

if (RS1>=rs)
    comparacion_RS1=num2str('ok');
else
    comparacion_RS1=num2str('Non');
end
    comparacion_RS={comparacion_RS1;[];[];[]};
    
  %Resolution bas contraste
RB1=tabla(1,15);
RB1=cell2mat(RB1);
RB1=str2double(RB1);

if (RB1>=bc)
    comparacion_RB1=num2str('ok');
else
    comparacion_RB1=num2str('Non');
end
    comparacion_RB={comparacion_RB1;[];[];[]};
    
    end
    