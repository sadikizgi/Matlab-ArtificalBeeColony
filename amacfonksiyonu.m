function uzaklik = amacfonksiyonu(besin,ilmesafe,sehirsayisi)
ustlimit =(sehirsayisi-1);
uzaklik = 0;
for i=1:ustlimit
    yeniuzaklik=ilmesafe(besin(i),besin(i+1));
    %�retmi� oldu�umuz rastgele de�erden 1.sinde ba�lay� i de�eri art�cak
    uzaklik=uzaklik+yeniuzaklik;
end
%ilk �ehirden son �ehire kadar gidicek .burda da ama� fonctionum 2 ye
%ayr�lcak
%son �ehirden ilk �ehire d�nme olucak ayr�lan k�s�m
yeniuzaklik=ilmesafe(besin(i+1),besin(1));
uzaklik=uzaklik+yeniuzaklik;