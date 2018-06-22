%yerelarama2 yi burda yazýcam 
%kaþif arýnýn aramasý için
function [sonucbesin,sonuccozumdegeri]=YerelArama2(besin,cozumdegeri,ilmesafe,sehirsayisi)
    %ilgili çözüm bozulmasýn die burda hafýzaya alýyorum
    sonucbesin=besin; %ilgili çözüm bozulmasýn die burda hafýzaya alýyorum
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
    
    %DÝZÝYÝ TERSÇEVÝRME KULLANDIM bu aramada