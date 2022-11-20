%Atraso anual

clc
clear all
cd ('C:\Users\thain\Documents\BEPE\Dados de saída\Delay\DEL');
alic_hop = xlsread('Alic_hop.xls');
alic_saast = xlsread('Alic_saast.xls');
alic_unb3m = xlsread('alic_unb3m.xls');
alic_cmc = xlsread('alic_cmc.xls');
alic_vmf1 = xlsread('alic_ecmwf.xls');

bamf_hop = xlsread('bamf_hop.xls');
bamf_saast = xlsread('bamf_saast.xls');
bamf_unb3m = xlsread('bamf_unb3m.xls');
bamf_cmc = xlsread('bamf_cmc.xls');
bamf_vmf1 = xlsread('bamf_ecmwf.xls');

mbar_hop = xlsread('mbar_hop.xls');
mbar_saast = xlsread('mbar_saast.xls');
mbar_unb3m = xlsread('mbar_unb3m.xls');
mbar_cmc = xlsread('mbar_cmc.xls');
mbar_vmf1 = xlsread('mbar_ecmwf.xls');

thu3_hop = xlsread('thu3_hop.xls');
thu3_saast = xlsread('thu3_saast.xls');
thu3_unb3m = xlsread('thu3_unb3m.xls');
thu3_cmc = xlsread('thu3_cmc.xls');
thu3_vmf1 = xlsread('thu3_ecmwf.xls');

unbj_hop = xlsread('unbj_hop.xls');
unbj_saast = xlsread('unbj_saast.xls');
unbj_unb3m = xlsread('unbj_unb3m.xls');
unbj_cmc = xlsread('unbj_cmc.xls');
unbj_vmf1 = xlsread('unbj_ecmwf.xls');

alic_hop = alic_hop(:,6)';
alic_saast = alic_saast(:,6)';
alic_unb3m = alic_unb3m(:,6)';
alic_cmc = alic_cmc(:,6)';
alic_vmf1 = alic_vmf1(:,6)';

bamf_hop = bamf_hop(:,6)';
bamf_saast = bamf_saast(:,6)';
bamf_unb3m = bamf_unb3m(:,6)';
bamf_cmc = bamf_cmc(:,6)';
bamf_vmf1 = bamf_vmf1(:,6)';

mbar_hop = mbar_hop(:,4)';
mbar_saast = mbar_saast(:,4)';
mbar_unb3m = mbar_unb3m(:,5)';
mbar_cmc = mbar_cmc(:,5)';
mbar_vmf1 = mbar_vmf1(:,5)';

thu3_hop = thu3_hop(:,6)';
thu3_saast = thu3_saast(:,6)';
thu3_unb3m = thu3_unb3m(:,6)';
thu3_cmc = thu3_cmc(:,6)';
thu3_vmf1 = thu3_vmf1(:,6)';

unbj_hop = unbj_hop(:,6)';
unbj_saast = unbj_saast(:,6)';
unbj_unb3m = unbj_unb3m(:,6)';
unbj_cmc = unbj_cmc(:,6)';
unbj_vmf1 = unbj_vmf1(:,6)';

t = datetime(2017,10,10) + caldays(1:366);
%y = unbj_hop;
%scatter(t,y, '--g','linewidth',4)

% **********************ALIC***********************************************
figure('units','normalized','outerposition',[0 0 1 1])
subplot(4,1,1)
plot(t,alic_hop,'linewidth',2);
hold on;
grid on;
plot(t,alic_saast,'linewidth',2);
hold on;
plot(t,alic_unb3m,'linewidth',2);
hold on;
plot(t,alic_cmc,'linewidth',2);
hold on;
plot(t,alic_vmf1,'linewidth',2);
set(gca,'xticklabel',[]) 
set(gca,'FontSize',14,'Ytick',0:0.09:max(unbj_hop)+0.1);
ylabel('ZTD(m)','FontSize', 14);
%a=axes('position',get(gca,'position'),'visible','off');
legend('Australia (ALIC)','Fontsize',14);
% legend('Hopfield','Saastamoinen','UNB3m','UNB-VMF1(CMC)','VMF1 (ECMWF)','Location','NorthEastOutside');
%xlabel('Time','FontSize', 14);
title('Zenital Total Delay','FontSize', 20); %MUDAR AQUI
hold off

%***************************BAMF******************************************
% subplot(5,1,2)
figure('units','normalized','outerposition',[0 0 1 1])
plot(t,bamf_hop,'linewidth',2);
hold on;
grid on;
plot(t,bamf_saast,'linewidth',2);
hold on;
plot(t,bamf_unb3m,'linewidth',2);
hold on;
plot(t,bamf_cmc,'linewidth',2);
hold on;
plot(t,bamf_vmf1,'linewidth',2);
set(gca,'FontSize',14,'Ytick',0:0.02:max(unbj_hop)+0.1);
xlabel('Time','FontSize', 14);
ylabel('ZTD(m)','FontSize', 14);
title('Canada (BAMF)','FontSize', 20); 
legend('Hopfield','Saastamoinen','UNB3m','UNB-VMF1(CMC)','VMF1 (ECMWF)','Fontsize',14); 
hold off

%*****************************MBAR******************************************
% subplot(4,1,2)
figure('units','normalized','outerposition',[0 0 1 1])
plot(t,mbar_hop,'linewidth',2);
hold on;
grid on;
plot(t,mbar_saast,'linewidth',2);
hold on;
plot(t,mbar_unb3m,'linewidth',2);
hold on;
plot(t,mbar_cmc,'linewidth',2);
hold on;
plot(t,mbar_vmf1,'linewidth',2);
% set(gca,'xticklabel',[]) 
set(gca,'FontSize',14,'Ytick',0:0.04:max(unbj_hop)+0.1);
xlabel('Time','FontSize', 14);
title('Uganda (MBAR)','FontSize', 20); 
legend('Hopfield','Saastamoinen','UNB3m','UNB-VMF1(CMC)','VMF1 (ECMWF)','Fontsize',14); 
ylabel('ZWD(m)','FontSize', 14);
% legend('Uganda (MBAR)','Fontsize',14);
hold off


% %*********************************UNBJ************************************
subplot(4,1,3)
figure('units','normalized','outerposition',[0 0 1 1])
plot(t,unbj_hop,'linewidth',2);
hold on;
grid on;
plot(t,unbj_saast,'linewidth',2);
hold on;
plot(t,unbj_unb3m,'linewidth',2);
hold on;
plot(t,unbj_cmc,'linewidth',2);
hold on;
plot(t,unbj_vmf1,'linewidth',2);
% set(gca,'xticklabel',[]) 
set(gca,'FontSize',14,'Ytick',0:0.04:max(unbj_hop)+0.1);
legend('Hopfield','Saastamoinen','UNB3m','UNB-VMF1(CMC)','VMF1 (ECMWF)');
xlabel('Time','FontSize', 14);
ylabel('ZTD(m)','FontSize', 14);
% legend('Canada (UNBJ)','Fontsize',14); 
title('Canada (UNBJ)','FontSize', 20); 
hold off

% *********************************THU3***************************************
subplot(4,1,4)
figure('units','normalized','outerposition',[0 0 1 1])
plot(t,thu3_hop,'linewidth',2);
hold on;
grid on;
plot(t,thu3_saast,'linewidth',2);
hold on;
plot(t,thu3_unb3m,'linewidth',2);
hold on;
plot(t,thu3_cmc,'linewidth',2);
hold on;
plot(t,thu3_vmf1,'linewidth',2);
set(gca,'FontSize',14,'Ytick',0:0.03:max(unbj_hop)+0.1);
xlabel('Time','FontSize', 14);
ylabel('ZTD(m)','FontSize', 14);
title('Greenland (THU3)','FontSize', 20);
legend('Hopfield','Saastamoinen','UNB3m','UNB-VMF1(CMC)','VMF1 (ECMWF)','Fontsize',14); 
% legend('Greenland (THU3)','Fontsize',14); 
hold off