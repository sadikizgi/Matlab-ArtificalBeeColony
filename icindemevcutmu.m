function var =icindemevcutmu(dizi,aranandeger)
var = 0;
for i=1:length(dizi)
    if dizi(i) == aranandeger
        var=1;
        break;
    end
end

%bir dizi oluþturuldu içinde o sayý varmý yokmu onu kontrol ediyoruz.Bu
%bize ayný þehirleri 2 kere gezmemizi engelleyecek.