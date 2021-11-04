function [ unif ] = uniformite2( I,centro_x,centro_y )

e1=imellipse(gca,[90 90 70 70]);
rmsk1=e1.createMask;
rn1=sum(rmsk1(:));%numero de pixels en la roi
rm1=mean(I(rmsk1));

rm_max=max(I(rmsk1))
rm_min=min(I(rmsk1))
unif=rm_max/rm_min

end

