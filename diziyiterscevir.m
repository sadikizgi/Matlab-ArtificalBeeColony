function yenibesin=diziyiterscevir(besin,indis1,indis2)
yenibesin=besin;
kucuk=min(indis1,indis2);
buyuk=max(indis1,indis2);
while kucuk<buyuk
    degisgen=yenibesin(kucuk);
    yenibesin(kucuk)=yenibesin(buyuk);
    yenibesin(buyuk)=degisgen;
    kucuk = kucuk+1;
    buyuk = buyuk-1;
end

%burda da min mesafeyi kateden yolu bulmaya �al��aca��z bu da bir arama
%y�netmi.E�er algoritma geli�mez ise eski ��z�m�de akl�nda tutuyor