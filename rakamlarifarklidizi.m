function dizi = rakamlarifarklidizi(aralik,altlimit,ustlimit)
if aralik>=1 && aralik<=(ustlimit-altlimit +1)
    dizi = [];
    for i = 1:aralik
        rastgelesayi=round(altlimit+(ustlimit-altlimit)*rand(1));
        %rastgelesayi = Rand(altlimit:ustlimit,aralik);
        %raund tamsayıya yuvarlama yapar
        while icindemevcutmu(dizi,rastgelesayi)
            rastgelesayi=round(altlimit+(ustlimit-altlimit)*rand(1));
        end
        dizi(i)=rastgelesayi;
    end
else
disp('HATA');
end

%amacımız verdiğimiz aralıklarda birbirine benzemeyen rastgele
%değerler oluşturmak .bu function bize ileride başlangıç konumundan
%başlayarak ratgele değerlerle gideceğimiz diğer durumu belirtmemizi
%sağlayacak.Ve tekrar aynı şehire dönmemizi sağlayacak
