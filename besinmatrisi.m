%besinmatrisi oluşturma
function matris=besinmatrisi(besinsayisi,sehirsayisi)
altlimit = 1 ;
ustlimit = sehirsayisi;
matris =[];
for i = 1:besinsayisi
    elemanlarifarklidizi=rakamlarifarklidizi(sehirsayisi,altlimit,ustlimit);
    matris = [matris;elemanlarifarklidizi];
end

%Şehir sayısı kadar besin oluşturudu.Alt ve üst limitleri belirtelen sayılar kadar
