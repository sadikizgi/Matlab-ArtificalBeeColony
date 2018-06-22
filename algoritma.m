clear all;
clc;
tic
sehirsayisi = 81; % Gezilecek olan þehir sayisi
isciarisayisi=15;
gozcuarisayisi=15;
%kaþif arisayisini 1 olarak kabul edicem onu girmicem
besinsayisi=50;
limit = 100;  %limitimiz 
ilmesafe=xlsread('ilmesafe.xls');
eniyicozumdegeri = 1000000;
eniyicozumdegeri = Inf;
besin=besinmatrisi(besinsayisi,sehirsayisi);
denemesayisi=zeros(size(besin(:,1)));
%sonsuz döngüye girmemesi için denemesayisi yaptýk
for i=1:besinsayisi
    cozumdegeri(i)=amacfonksiyonu(besin(i,:),ilmesafe,sehirsayisi);
    %herbir çözüm satýrýnýn çözüm degerini elde edicez ve karþýlaþtýrmyý
    %saðlýyacaðýz
    if eniyicozumdegeri>cozumdegeri(i)
        eniyicozumdegeri=cozumdegeri(i);
        eniyicozum=besin(i,:);
    end
end
for iterasyon=1:500

%iþçi arý safhasý baþlar
for i=1:isciarisayisi
    degisecekbesinno= randi([1 besinsayisi]); % rastgele bir satýrý seçtik
    r=rand(1);
    indis1=randi([1 sehirsayisi]);
    indis2=randi([1 sehirsayisi]);
    while indis1 == indis2 
        indis2=randi([1 sehirsayisi]);
    end
    %Besin oluþurken kullanýlan fonksiyonlarla çözümü iyileþtirmek
    if r<1/3
      yenibesin = yerdegistir(besin(degisecekbesinno,:) ,indis1,indis2);
    elseif r<2/3
      yenibesin = solakaydir(besin(degisecekbesinno,:), indis1,indis2);
   else
      yenibesin = diziyiterscevir(besin(degisecekbesinno,:), indis1,indis2);
    end
    
    
% eðer daha iyi bir çözüm kalitesi elde edersek bunu hafýzaya alalým
yenicozumdegeri=amacfonksiyonu(yenibesin,ilmesafe,sehirsayisi);
if yenicozumdegeri<cozumdegeri(degisecekbesinno)
    cozumdegeri(degisecekbesinno)=yenicozumdegeri;
    besin(degisecekbesinno,:)=yenibesin; % matrise atma da yapalým
    denemesayisi(degisecekbesinno)=0;
    if eniyicozumdegeri>yenicozumdegeri
        eniyicozumdegeri=yenicozumdegeri;
        eniyicozum=yenibesin;
    end
else
    denemesayisi(degisecekbesinno) = denemesayisi(degisecekbesinno)+1;
end
end

%iþçi ari safhasý bitti.Þimdide gözcü arý safhasýna geçtim

sabit = 1;
for i=1:besinsayisi
    minicinuygunluk(i)=sabit/cozumdegeri(i);
end
cozumdegerleritoplami = 0 ;
for i=1:besinsayisi
    cozumdegerleritoplami=cozumdegerleritoplami+minicinuygunluk(i);
end
for i=1:besinsayisi
    uygunluk(i)=minicinuygunluk(i)/cozumdegerleritoplami;
end
for i=1:gozcuarisayisi
    degisecekbesinno=besinsec(uygunluk);
    r=rand(1);
    indis1=randi([1 sehirsayisi]);
    indis2=randi([1 sehirsayisi]);
    while indis1 == indis2 
        indis2=randi([1 sehirsayisi]);
    end
    % indis1 ile indis2 deðerinin birbirine eþit olmasýný istemiyorum. bu
    % yüzden rastgele bir degeer daha oluþucak
    if r<1/3
        yenibesin=yerdegistir(besin(degisecekbesinno,:),indis1,indis2);
    elseif r<2/3
        yenibesin=diziyiterscevir(besin(degisecekbesinno,:),indis1,indis2);
    else
        yenibesin=solakaydir(besin(degisecekbesinno,:),indis1,indis2);
    end
    yenicozumdegeri=amacfonksiyonu(yenibesin,ilmesafe,sehirsayisi);
    
    if yenicozumdegeri<cozumdegeri(degisecekbesinno)
        cozumdegeri(degisecekbesinno)=yenicozumdegeri;
        besin(degisecekbesinno,:)=yenibesin;
        denemesayisi(degisecekbesinno)=0;
        if eniyicozumdegeri >yenicozumdegeri
            eniyicozumdegeri=yenicozumdegeri;
            eniyicozum =yenibesin;
            
        end
    else
        denemesayisi(degisecekbesinno) = denemesayisi(degisecekbesinno)+1;      
    end
end
    %gözcü ari safhasý bitti
    %kaþif arý safhasý baþlar
    for i=1:besinsayisi % ilgili besin satýrýnda tek tek bakýcak ve rastgele besin satýrýný seçicek
        if denemesayisi(i)>limit
            denemesayisi(i)=0;
            [besin(i,:),cozumdegeri(i)]=YerelArama1(besin(i,:),cozumdegeri(i),ilmesafe,sehirsayisi);
            if eniyicozumdegeri>cozumdegeri(i)
                eniyicozumdegeri=cozumdegeri(i);
                eniyicozum=besin(i,:);
            end
            [besin(i,:),cozumdegeri(i)]=YerelArama2(besin(i,:),cozumdegeri(i),ilmesafe,sehirsayisi);
            if eniyicozumdegeri>cozumdegeri(i)
                eniyicozumdegeri=cozumdegeri(i);
                eniyicozum=besin(i,:);
            end
        end
    end
    %kaþif arý safhasý bitti
    fprintf('iterasyon : %d En iyi çözüm: %d \n',iterasyon,eniyicozumdegeri);
    
       
end
toc 
%figüre baþlangýcý 
for i=1:sehirsayisi
   %x(i) = linspace(1,81);
   x(i) = [i];
   y(i)= [eniyicozum(i)];
%fprintf('deger: %d Cozum : %d\n',i,eniyicozum(i));
    
   
end
figure



plot(x,y,'r-')
hold on
plot(x,y,'s','MarkerSize',5)
grid
set(gca,'YTick',1:sehirsayisi)
set(gca,'XTick',1:sehirsayisi)
axis tight

title({'SIRT ÇANTASI PROBLEMÝ YAPAY ARI KOLONÝSÝ ALGORÝTMASI','ÝLLERE GÖRE EN KISA MESAFEYLE DOLAÞMA TABLOSU'})
xlabel('ÝLLERÝN PLAKA NUMARALARINA GÖRE SIRASI')
ylabel('ÝLLERÝN GEZME SIRASI')
 %figure bitiþi

