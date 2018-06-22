function uzaklik = amacfonksiyonu(besin,ilmesafe,sehirsayisi)
ustlimit =(sehirsayisi-1);
uzaklik = 0;
for i=1:ustlimit
    yeniuzaklik=ilmesafe(besin(i),besin(i+1));
    %üretmiþ olduðumuz rastgele deðerden 1.sinde baþlayý i deðeri artýcak
    uzaklik=uzaklik+yeniuzaklik;
end
%ilk þehirden son þehire kadar gidicek .burda da amaç fonctionum 2 ye
%ayrýlcak
%son þehirden ilk þehire dönme olucak ayrýlan kýsým
yeniuzaklik=ilmesafe(besin(i+1),besin(1));
uzaklik=uzaklik+yeniuzaklik;