function var =icindemevcutmu(dizi,aranandeger)
var = 0;
for i=1:length(dizi)
    if dizi(i) == aranandeger
        var=1;
        break;
    end
end

%bir dizi olu�turuldu i�inde o say� varm� yokmu onu kontrol ediyoruz.Bu
%bize ayn� �ehirleri 2 kere gezmemizi engelleyecek.