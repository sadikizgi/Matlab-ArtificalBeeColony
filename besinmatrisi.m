%besinmatrisi olu�turma
function matris=besinmatrisi(besinsayisi,sehirsayisi)
altlimit = 1 ;
ustlimit = sehirsayisi;
matris =[];
for i = 1:besinsayisi
    elemanlarifarklidizi=rakamlarifarklidizi(sehirsayisi,altlimit,ustlimit);
    matris = [matris;elemanlarifarklidizi];
end

%�ehir say�s� kadar besin olu�turudu.Alt ve �st limitleri belirtelen say�lar kadar
