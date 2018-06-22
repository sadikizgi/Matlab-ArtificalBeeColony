clear all;
clc;
tic
sehirsayisi = 81; % Gezilecek olan �ehir sayisi
isciarisayisi=15;
gozcuarisayisi=15;
%ka�if arisayisini 1 olarak kabul edicem onu girmicem
besinsayisi=50;
limit = 100;  %limitimiz 
ilmesafe=xlsread('ilmesafe.xls');
eniyicozumdegeri = 1000000;
eniyicozumdegeri = Inf;
besin=besinmatrisi(besinsayisi,sehirsayisi);
denemesayisi=zeros(size(besin(:,1)));
%sonsuz d�ng�ye girmemesi i�in denemesayisi yapt�k
for i=1:besinsayisi
    cozumdegeri(i)=amacfonksiyonu(besin(i,:),ilmesafe,sehirsayisi);
    %herbir ��z�m sat�r�n�n ��z�m degerini elde edicez ve kar��la�t�rmy�
    %sa�l�yaca��z
    if eniyicozumdegeri>cozumdegeri(i)
        eniyicozumdegeri=cozumdegeri(i);
        eniyicozum=besin(i,:);
    end
end
for iterasyon=1:500

%i��i ar� safhas� ba�lar
for i=1:isciarisayisi
    degisecekbesinno= randi([1 besinsayisi]); % rastgele bir sat�r� se�tik
    r=rand(1);
    indis1=randi([1 sehirsayisi]);
    indis2=randi([1 sehirsayisi]);
    while indis1 == indis2 
        indis2=randi([1 sehirsayisi]);
    end
    %Besin olu�urken kullan�lan fonksiyonlarla ��z�m� iyile�tirmek
    if r<1/3
      yenibesin = yerdegistir(besin(degisecekbesinno,:) ,indis1,indis2);
    elseif r<2/3
      yenibesin = solakaydir(besin(degisecekbesinno,:), indis1,indis2);
   else
      yenibesin = diziyiterscevir(besin(degisecekbesinno,:), indis1,indis2);
    end
    
    
% e�er daha iyi bir ��z�m kalitesi elde edersek bunu haf�zaya alal�m
yenicozumdegeri=amacfonksiyonu(yenibesin,ilmesafe,sehirsayisi);
if yenicozumdegeri<cozumdegeri(degisecekbesinno)
    cozumdegeri(degisecekbesinno)=yenicozumdegeri;
    besin(degisecekbesinno,:)=yenibesin; % matrise atma da yapal�m
    denemesayisi(degisecekbesinno)=0;
    if eniyicozumdegeri>yenicozumdegeri
        eniyicozumdegeri=yenicozumdegeri;
        eniyicozum=yenibesin;
    end
else
    denemesayisi(degisecekbesinno) = denemesayisi(degisecekbesinno)+1;
end
end

%i��i ari safhas� bitti.�imdide g�zc� ar� safhas�na ge�tim

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
    % indis1 ile indis2 de�erinin birbirine e�it olmas�n� istemiyorum. bu
    % y�zden rastgele bir degeer daha olu�ucak
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
    %g�zc� ari safhas� bitti
    %ka�if ar� safhas� ba�lar
    for i=1:besinsayisi % ilgili besin sat�r�nda tek tek bak�cak ve rastgele besin sat�r�n� se�icek
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
    %ka�if ar� safhas� bitti
    fprintf('iterasyon : %d En iyi ��z�m: %d \n',iterasyon,eniyicozumdegeri);
    
       
end
toc 
%fig�re ba�lang�c� 
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

title({'SIRT �ANTASI PROBLEM� YAPAY ARI KOLON�S� ALGOR�TMASI','�LLERE G�RE EN KISA MESAFEYLE DOLA�MA TABLOSU'})
xlabel('�LLER�N PLAKA NUMARALARINA G�RE SIRASI')
ylabel('�LLER�N GEZME SIRASI')
 %figure biti�i

