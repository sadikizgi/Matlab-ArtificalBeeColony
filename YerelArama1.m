%2 tane yerel arama yap�cam bunlardan 1.si burda yerelarama1 olucak
%bunlar ka�if arilar a�in aramad�r
function [sonucbesin,sonuccozumdegeri]=YerelArama1(besin,cozumdegeri,ilmesafe,sehirsayisi)
sonucbesin=besin;
sonuccozumdegeri=cozumdegeri;
for i=1:length(sonucbesin)-1
    for j=1:length(sonucbesin)
        yenibesin=solakaydir(sonucbesin,i,j);
        yeniamacfonksiyonu=amacfonksiyonu(yenibesin,ilmesafe,sehirsayisi);
        if yeniamacfonksiyonu<sonuccozumdegeri
            sonuccozumdegeri=yeniamacfonksiyonu;
            sonucbesin=yenibesin;
        end
    end
end
% elde etti�imiz ��z�m de�eri di�erinden daha iyi ise de�i�icek. e�er
% de�ilse ayn� kal�cak 
%SOLAKAYD�RMA KULLANDIM bu aramada