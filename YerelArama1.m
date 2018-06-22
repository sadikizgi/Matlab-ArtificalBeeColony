%2 tane yerel arama yapýcam bunlardan 1.si burda yerelarama1 olucak
%bunlar kaþif arilar açin aramadýr
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
% elde ettiðimiz çözüm deðeri diðerinden daha iyi ise deðiþicek. eðer
% deðilse ayný kalýcak 
%SOLAKAYDÝRMA KULLANDIM bu aramada