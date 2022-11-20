%Diference between coordenates using GAPS and the IGS weekly solution

clear all
clc
format long
cd ('C:\Users\thain\Documents\BEPE\Dados de saída\Coordenates\cmc - not estimated');
alic = xlsread('ALIC_cmc.xls');
bamf = xlsread('BAMF_cmc.xls');
mbar = xlsread('MBAR_cmc.xls');
unbj = xlsread('UNBJ_cmc.xls');
thu3 = xlsread('THU3_cmc.xls');
weekly_coordenates =  xlsread('coordenates_IGS.xls');

alic_x = alic(:,4);
alic_y = alic(:,5);
alic_z = alic(:,6);
alic_igs_x = weekly_coordenates(1,1);
alic_igs_y = weekly_coordenates(1,2);
alic_igs_z = weekly_coordenates(1,3);

bamf_x = bamf(:,4);
bamf_y = bamf(:,5);
bamf_z = bamf(:,6);
bamf_igs_x = weekly_coordenates(2,1);
bamf_igs_y = weekly_coordenates(2,2);
bamf_igs_z = weekly_coordenates(2,3);

mbar_x = mbar(:,4);
mbar_y = mbar(:,5);
mbar_z = mbar(:,6);
mbar_igs_x = weekly_coordenates(3,1);
mbar_igs_y = weekly_coordenates(3,2);
mbar_igs_z = weekly_coordenates(3,3);

unbj_x = unbj(:,4);
unbj_y = unbj(:,5);
unbj_z = unbj(:,6);
unbj_igs_x = weekly_coordenates(5,1);
unbj_igs_y = weekly_coordenates(5,2);
unbj_igs_z = weekly_coordenates(5,3);

thu3_x = thu3(:,4);
thu3_y = thu3(:,5);
thu3_z = thu3(:,6);
thu3_igs_x = weekly_coordenates(4,1);
thu3_igs_y = weekly_coordenates(4,2);
thu3_igs_z = weekly_coordenates(4,3);

tam = length(alic_x);

%ALIC
for  i = 1:tam
    X_dif(i) = abs(alic_igs_x - alic_x(i));
    Y_dif(i) = abs(alic_igs_y - alic_y(i));
    Z_dif(i) = abs(alic_igs_z - alic_z(i));
end
alic_ecmwf = [X_dif; Y_dif; Z_dif]';
cd ('C:\Users\thain\Documents\BEPE\Dados de saída\Coordenates\diferences\cmc - not estimated');
xlswrite('alic_cmc', alic_ecmwf);
X_dif = zeros([1 tam]);
Y_dif = zeros([1 tam]);
Z_dif = zeros([1 tam]);

%MBAR
for  i = 1:tam
    X_dif(i) = abs(mbar_igs_x - mbar_x(i));
    Y_dif(i) = abs(mbar_igs_y - mbar_y(i));
    Z_dif(i) = abs(mbar_igs_z - mbar_z(i));
end
mbar_ecmwf = [X_dif; Y_dif; Z_dif]';
cd ('C:\Users\thain\Documents\BEPE\Dados de saída\Coordenates\diferences\cmc - not estimated');
xlswrite('mbar_cmc', mbar_ecmwf);
X_dif = zeros([1 tam]);
Y_dif = zeros([1 tam]);
Z_dif = zeros([1 tam]);

%BAMF
for  i = 1:tam
    X_dif(i) = abs(bamf_igs_x - bamf_x(i));
    Y_dif(i) = abs(bamf_igs_y - bamf_y(i));
    Z_dif(i) = abs(bamf_igs_z - bamf_z(i));
end
bamf_ecmwf = [X_dif; Y_dif; Z_dif]';
cd ('C:\Users\thain\Documents\BEPE\Dados de saída\Coordenates\diferences\cmc - not estimated');
xlswrite('bamf_cmc', bamf_ecmwf);
X_dif = zeros([1 tam]);
Y_dif = zeros([1 tam]);
Z_dif = zeros([1 tam]);

%THU3
for  i = 1:tam
    X_dif(i) = abs(thu3_igs_x - thu3_x(i));
    Y_dif(i) = abs(thu3_igs_y - thu3_y(i));
    Z_dif(i) = abs(thu3_igs_z - thu3_z(i));
end
thu3_ecmwf = [X_dif; Y_dif; Z_dif]';
cd ('C:\Users\thain\Documents\BEPE\Dados de saída\Coordenates\diferences\cmc - not estimated');
xlswrite('thu3_cmc', thu3_ecmwf);
X_dif = zeros([1 tam]);
Y_dif = zeros([1 tam]);
Z_dif = zeros([1 tam]);

%UNBJ
for  i = 1:tam
    X_dif(i) = abs(unbj_igs_x - unbj_x(i));
    Y_dif(i) = abs(unbj_igs_y - unbj_y(i));
    Z_dif(i) = abs(unbj_igs_z - unbj_z(i));
end
unbj_ecmwf = [X_dif; Y_dif; Z_dif]';
cd ('C:\Users\thain\Documents\BEPE\Dados de saída\Coordenates\diferences\cmc - not estimated');
xlswrite('unbj_cmc', unbj_ecmwf);