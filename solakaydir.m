%sola kaydýrma
function yenibesin=solakaydir(besin,indis1,indis2)
% çözümde iðleþtirme olmassa eski olan bozulmasýn die bu kýsým
yenibesin=besin; 
kucuk=min(indis1,indis2);
buyuk=max(indis1,indis2);
ilkeleman=yenibesin(kucuk);
for i=kucuk:(buyuk-1)
    yenibesin(i) = yenibesin(i+1);
end
yenibesin(buyuk)=ilkeleman;

%burda da min mesafeyi kateden yolu bulmaya çalýþacaðýz bu da bir arama
%yönetmi