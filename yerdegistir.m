%minimum mesafeyi kat eden yolu bulmaya �al���caz yer de�i�tirme op. belirleme
function yenibesin=yerdegistir(besin,indis1,indis2)
yenibesin = besin;
degisgen=yenibesin(indis1);
yenibesin(indis1)=yenibesin(indis2);
yenibesin(indis2) = degisgen;
end