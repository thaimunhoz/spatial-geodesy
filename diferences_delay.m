%Diference between Saastamoinen and NWP models
clc
clear all
format long
cd ('C:\Users\thain\Documents\BEPE\Dados de saída\Delay\DEL');
alic_saast = xlsread('Alic_saast.xls');
alic_unb3m = xlsread('alic_unb3m.xls');
alic_cmc = xlsread('alic_cmc.xls');
alic_vmf1 = xlsread('alic_ecmwf.xls');

bamf_saast = xlsread('bamf_saast.xls');
bamf_unb3m = xlsread('bamf_unb3m.xls');
bamf_cmc = xlsread('bamf_cmc.xls');
bamf_vmf1 = xlsread('bamf_ecmwf.xls');

mbar_saast = xlsread('mbar_saast.xls');
mbar_unb3m = xlsread('mbar_unb3m.xls');
mbar_cmc = xlsread('mbar_cmc.xls');
mbar_vmf1 = xlsread('mbar_ecmwf.xls');

thu3_saast = xlsread('thu3_saast.xls');
thu3_unb3m = xlsread('thu3_unb3m.xls');
thu3_cmc = xlsread('thu3_cmc.xls');
thu3_vmf1 = xlsread('thu3_ecmwf.xls');

unbj_saast = xlsread('unbj_saast.xls');
unbj_unb3m = xlsread('unbj_unb3m.xls');
unbj_cmc = xlsread('unbj_cmc.xls');
unbj_vmf1 = xlsread('unbj_ecmwf.xls');

%ALIC
Alic_zhd_unb3m = abs(alic_saast(:,5) - alic_unb3m(:,4));
Alic_zwd_unb3m = abs(alic_saast(:,4) - alic_unb3m(:,5));
Alic_ztd_unb3m = abs(alic_saast(:,6) - alic_unb3m(:,6));
alic_unb3m_dif = [Alic_zhd_unb3m, Alic_zwd_unb3m, Alic_ztd_unb3m];
cd ('C:\Users\thain\Documents\BEPE\Dados de saída\Delay\Diferences\alic');
xlswrite('alic_unb3m', alic_unb3m_dif);

Alic_zhd_cmc= abs(alic_saast(:,5) - alic_cmc(:,4));
Alic_zwd_cmc = abs(alic_saast(:,4) - alic_cmc(:,5));
Alic_ztd_cmc = abs(alic_saast(:,6) - alic_cmc(:,6));
alic_cmc_dif = [Alic_zhd_cmc, Alic_zwd_cmc, Alic_ztd_cmc];
cd ('C:\Users\thain\Documents\BEPE\Dados de saída\Delay\Diferences\alic');
xlswrite('alic_cmc', alic_cmc_dif);

Alic_zhd_vmf1 = abs(alic_saast(:,5) - alic_vmf1(:,4));
Alic_zwd_vmf1 = abs(alic_saast(:,4) - alic_vmf1(:,5));
Alic_ztd_vmf1 = abs(alic_saast(:,6) - alic_vmf1(:,6));
alic_vmf1_dif = [Alic_zhd_vmf1, Alic_zwd_vmf1, Alic_ztd_vmf1];
cd ('C:\Users\thain\Documents\BEPE\Dados de saída\Delay\Diferences\alic');
xlswrite('alic_vmf1', alic_vmf1_dif);

%BAMF
bamf_zhd_unb3m = abs(bamf_saast(:,5) - bamf_unb3m(:,4));
bamf_zwd_unb3m = abs(bamf_saast(:,4) - bamf_unb3m(:,5));
bamf_ztd_unb3m = abs(bamf_saast(:,6) - bamf_unb3m(:,6));
bamf_unb3m_dif = [bamf_zhd_unb3m, bamf_zwd_unb3m, bamf_ztd_unb3m];
cd ('C:\Users\thain\Documents\BEPE\Dados de saída\Delay\Diferences\bamf');
xlswrite('bamf_unb3m', bamf_unb3m_dif);

bamf_zhd_cmc= abs(bamf_saast(:,5) - bamf_cmc(:,4));
bamf_zwd_cmc = abs(bamf_saast(:,4) - bamf_cmc(:,5));
bamf_ztd_cmc = abs(bamf_saast(:,6) - bamf_cmc(:,6));
bamf_cmc_dif = [bamf_zhd_cmc, bamf_zwd_cmc, bamf_ztd_cmc];
cd ('C:\Users\thain\Documents\BEPE\Dados de saída\Delay\Diferences\bamf');
xlswrite('bamf_cmc', bamf_cmc_dif);

bamf_zhd_vmf1 = abs(bamf_saast(:,5) - bamf_vmf1(:,4));
bamf_zwd_vmf1 = abs(bamf_saast(:,4) - bamf_vmf1(:,5));
bamf_ztd_vmf1 = abs(bamf_saast(:,6) - bamf_vmf1(:,6));
bamf_vmf1_dif = [bamf_zhd_vmf1, bamf_zwd_vmf1, bamf_ztd_vmf1];
cd ('C:\Users\thain\Documents\BEPE\Dados de saída\Delay\Diferences\bamf');
xlswrite('bamf_vmf1', bamf_vmf1_dif);

%MBAR
mbar_zhd_unb3m = abs(mbar_saast(:,5) - mbar_unb3m(:,4));
mbar_zwd_unb3m = abs(mbar_saast(:,4) - mbar_unb3m(:,5));
mbar_ztd_unb3m = abs(mbar_saast(:,6) - mbar_unb3m(:,6));
mbar_unb3m_dif = [mbar_zhd_unb3m, mbar_zwd_unb3m, mbar_ztd_unb3m];
cd ('C:\Users\thain\Documents\BEPE\Dados de saída\Delay\Diferences\mbar');
xlswrite('bamf_unb3m', mbar_unb3m_dif);

mbar_zhd_cmc= abs(mbar_saast(:,5) - mbar_cmc(:,4));
mbar_zwd_cmc = abs(mbar_saast(:,4) - mbar_cmc(:,5));
mbar_ztd_cmc = abs(mbar_saast(:,6) - mbar_cmc(:,6));
mbar_cmc_dif = [mbar_zhd_cmc, mbar_zwd_cmc, mbar_ztd_cmc];
cd ('C:\Users\thain\Documents\BEPE\Dados de saída\Delay\Diferences\mbar');
xlswrite('mbar_cmc', mbar_cmc_dif);

mbar_zhd_vmf1 = abs(mbar_saast(:,5) - mbar_vmf1(:,4));
mbar_zwd_vmf1 = abs(mbar_saast(:,4) - mbar_vmf1(:,5));
mbar_ztd_vmf1 = abs(mbar_saast(:,6) - mbar_vmf1(:,6));
mbar_vmf1_dif = [mbar_zhd_vmf1, mbar_zwd_vmf1, mbar_ztd_vmf1];
cd ('C:\Users\thain\Documents\BEPE\Dados de saída\Delay\Diferences\mbar');
xlswrite('mbar_vmf1', mbar_vmf1_dif);

%UNBJ
unbj_zhd_unb3m = abs(unbj_saast(:,5) - unbj_unb3m(:,4));
unbj_zwd_unb3m = abs(unbj_saast(:,4) - unbj_unb3m(:,5));
unbj_ztd_unb3m = abs(unbj_saast(:,6) - unbj_unb3m(:,6));
unbj_unb3m_dif = [unbj_zhd_unb3m, unbj_zwd_unb3m, unbj_ztd_unb3m];
cd ('C:\Users\thain\Documents\BEPE\Dados de saída\Delay\Diferences\unbj');
xlswrite('unbj_unb3m', unbj_unb3m_dif);

unbj_zhd_cmc= abs(unbj_saast(:,5) - unbj_cmc(:,4));
unbj_zwd_cmc = abs(unbj_saast(:,4) - unbj_cmc(:,5));
unbj_ztd_cmc = abs(unbj_saast(:,6) - unbj_cmc(:,6));
unbj_cmc_dif = [unbj_zhd_cmc, unbj_zwd_cmc, unbj_ztd_cmc];
cd ('C:\Users\thain\Documents\BEPE\Dados de saída\Delay\Diferences\unbj');
xlswrite('unbj_cmc', unbj_cmc_dif);

unbj_zhd_vmf1 = abs(unbj_saast(:,5) - unbj_vmf1(:,4));
unbj_zwd_vmf1 = abs(unbj_saast(:,4) - unbj_vmf1(:,5));
unbj_ztd_vmf1 = abs(unbj_saast(:,6) - unbj_vmf1(:,6));
unbj_vmf1_dif = [unbj_zhd_vmf1, unbj_zwd_vmf1, unbj_ztd_vmf1];
cd ('C:\Users\thain\Documents\BEPE\Dados de saída\Delay\Diferences\unbj');
xlswrite('unbj_vmf1', unbj_vmf1_dif);

%THU3
thu3_zhd_unb3m = abs(thu3_saast(:,5) - thu3_unb3m(:,4));
thu3_zwd_unb3m = abs(thu3_saast(:,4) - thu3_unb3m(:,5));
thu3_ztd_unb3m = abs(thu3_saast(:,6) - thu3_unb3m(:,6));
thu3_unb3m_dif = [thu3_zhd_unb3m, thu3_zwd_unb3m, thu3_ztd_unb3m];
cd ('C:\Users\thain\Documents\BEPE\Dados de saída\Delay\Diferences\thu3');
xlswrite('thu3_unb3m', thu3_unb3m_dif);

thu3_zhd_cmc= abs(thu3_saast(:,5) - thu3_cmc(:,4));
thu3_zwd_cmc = abs(thu3_saast(:,4) - thu3_cmc(:,5));
thu3_ztd_cmc = abs(thu3_saast(:,6) - thu3_cmc(:,6));
thu3_cmc_dif = [thu3_zhd_cmc, thu3_zwd_cmc, thu3_ztd_cmc];
cd ('C:\Users\thain\Documents\BEPE\Dados de saída\Delay\Diferences\thu3');
xlswrite('thu3_cmc', thu3_cmc_dif);

thu3_zhd_vmf1 = abs(thu3_saast(:,5) - thu3_vmf1(:,4));
thu3_zwd_vmf1 = abs(thu3_saast(:,4) - thu3_vmf1(:,5));
thu3_ztd_vmf1 = abs(thu3_saast(:,6) - thu3_vmf1(:,6));
thu3_vmf1_dif = [thu3_zhd_vmf1, thu3_zwd_vmf1, thu3_ztd_vmf1];
cd ('C:\Users\thain\Documents\BEPE\Dados de saída\Delay\Diferences\thu3');
xlswrite('thu3_vmf1', thu3_vmf1_dif);