clear all
clc
cd ('C:\Users\thain\Documents\BEPE\Dados de saída\Coordenates\diferences\station');
vmf1 = xlsread('mbar_ecmwf.xls');
cmc = xlsread('mbar_cmc.xls');
unb3m = xlsread('mbar_unb3m.xls');

vmf1_x = vmf1(:,4);
vmf1_y = vmf1(:,5);
vmf1_z = vmf1(:,6);

cmc_x = cmc(:,4);
cmc_y = cmc(:,5);
cmc_z = cmc(:,6);

unb3m_x = unb3m(:,4);
unb3m_y = unb3m(:,5);
unb3m_z = unb3m(:,6);

t = datetime(2017,10,10) + caldays(1:366);

figure('units','normalized','outerposition',[0 0 1 1])
subplot(3,1,1)
plot(t,vmf1_x,'g','linewidth',2);
hold on;
grid on;
plot(t,cmc_x,'b','linewidth',2);
hold on;
plot(t,unb3m_x,'r','linewidth',2);
set(gca,'xticklabel',[]) 
set(gca,'FontSize',15,'Ytick',0:0.04:max(cmc_x)+0.1);
ylabel('\DeltaX(m)','FontSize', 15);
legend('UNB-VMF1(ECMWF)','UNB-VMF1(CMC)','UNB3m','Fontsize',15);
%xlabel('Time','FontSize', 14);
title('Uganda (MBAR)','FontSize', 22);
hold off

subplot(3,1,2)
plot(t,vmf1_y,'g','linewidth',2);
hold on;
grid on;
plot(t,cmc_y,'b','linewidth',2);
hold on;
plot(t,unb3m_y,'r','linewidth',2);
set(gca,'xticklabel',[]) 
set(gca,'FontSize',15,'Ytick',0:0.05:max(cmc_y)+0.1);
ylabel('\DeltaY(m)','FontSize', 15);
%legend('UNB-VMF1(ECMWF)','UNB-VMF1(CMC)','UNB3m','Fontsize',15);
%xlabel('Time','FontSize', 14);
%title('Australia (ALIC)','FontSize', 20);
hold off

subplot(3,1,3)
plot(t,vmf1_z,'g','linewidth',2);
hold on;
grid on;
plot(t,cmc_z,'b','linewidth',2);
hold on;
plot(t,unb3m_z,'r','linewidth',2);
%set(gca,'xticklabel',[]) 
set(gca,'FontSize',15,'Ytick',0:0.07:max(unb3m_z)+0.1);
ylabel('\DeltaZ(m)','FontSize', 15);
%legend('UNB-VMF1(ECMWF)','UNB-VMF1(CMC)','UNB3m','Fontsize',15);
xlabel('Time','FontSize', 15);
%title('Australia (ALIC)','FontSize', 20);
hold off