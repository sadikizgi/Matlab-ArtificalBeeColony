function dizi = rakamlarifarklidizi(aralik,altlimit,ustlimit)
if aralik>=1 && aralik<=(ustlimit-altlimit +1)
    dizi = [];
    for i = 1:aralik
        rastgelesayi=round(altlimit+(ustlimit-altlimit)*rand(1));
        %rastgelesayi = Rand(altlimit:ustlimit,aralik);
        %raund tamsay�ya yuvarlama yapar
        while icindemevcutmu(dizi,rastgelesayi)
            rastgelesayi=round(altlimit+(ustlimit-altlimit)*rand(1));
        end
        dizi(i)=rastgelesayi;
    end
else
disp('HATA');
end

%amac�m�z verdi�imiz aral�klarda birbirine benzemeyen rastgele
%de�erler olu�turmak .bu function bize ileride ba�lang�� konumundan
%ba�layarak ratgele de�erlerle gidece�imiz di�er durumu belirtmemizi
%sa�layacak.Ve tekrar ayn� �ehire d�nmemizi sa�layacak
