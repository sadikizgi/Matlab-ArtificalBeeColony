%minimum mesafeyi kat eden yolu bulmaya çalışıcaz yer değiştirme op. belirleme
function yenibesin=yerdegistir(besin,indis1,indis2)
yenibesin = besin;
degisgen=yenibesin(indis1);
yenibesin(indis1)=yenibesin(indis2);
yenibesin(indis2) = degisgen;
end