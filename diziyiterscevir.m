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

%burda da min mesafeyi kateden yolu bulmaya çalýþacaðýz bu da bir arama
%yönetmi.Eðer algoritma geliþmez ise eski çözümüde aklýnda tutuyor