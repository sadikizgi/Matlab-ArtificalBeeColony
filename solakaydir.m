%sola kayd�rma
function yenibesin=solakaydir(besin,indis1,indis2)
% ��z�mde i�le�tirme olmassa eski olan bozulmas�n die bu k�s�m
yenibesin=besin; 
kucuk=min(indis1,indis2);
buyuk=max(indis1,indis2);
ilkeleman=yenibesin(kucuk);
for i=kucuk:(buyuk-1)
    yenibesin(i) = yenibesin(i+1);
end
yenibesin(buyuk)=ilkeleman;

%burda da min mesafeyi kateden yolu bulmaya �al��aca��z bu da bir arama
%y�netmi