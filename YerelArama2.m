%yerelarama2 yi burda yaz�cam 
%ka�if ar�n�n aramas� i�in
function [sonucbesin,sonuccozumdegeri]=YerelArama2(besin,cozumdegeri,ilmesafe,sehirsayisi)
    %ilgili ��z�m bozulmas�n die burda haf�zaya al�yorum
    sonucbesin=besin; %ilgili ��z�m bozulmas�n die burda haf�zaya al�yorum
    sonuccozumdegeri=cozumdegeri;
    for i=1:length(sonucbesin)-1
    for j=1:length(sonucbesin)
        yenibesin=diziyiterscevir(sonucbesin,i,j);
        yeniamacfonksiyonu=amacfonksiyonu(yenibesin,ilmesafe,sehirsayisi);
        if yeniamacfonksiyonu<sonuccozumdegeri
            sonuccozumdegeri=yeniamacfonksiyonu;
            sonucbesin=yenibesin;
        end
    end
    end
    
    %D�Z�Y� TERS�EV�RME KULLANDIM bu aramada