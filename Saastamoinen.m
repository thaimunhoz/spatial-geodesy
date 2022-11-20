function [] = Saastamoinen_Zenite()
    clear all
    clc
    lat = input('Digite o valor da latitude da esta��o em graus');
    h = input('Digite o valor da altitude da esta��o');
    cd ('C:\Users\thain\Documents\BEPE\Met_Par');
    Data = xlsread('Pluv_MG');
    h = h/1000;
    Temp = Data(:,5); %Temperatura do Bulbo Seco em Celsius
    Umid = Data(:,6); %Umidade relativa em porcentagem
    Press = Data(:,4); %Press�o parcial em Hpa

    for a = 1:62
        T = Temp(a,1);
        f = Umid(a,1);
        P = Press(a,1);
        e = Pression(f, T);
        T = T+273.15;
        
        %ZWD
        ZWD_S = Zwd_f_S(lat,h,T,e);
        flag = 2;
        Dzw_s(a) = ZWD_S; 
        
        %ZHD
        Dzh = Zhd_f_S(lat,h,P);
        flag = 1;
        Dzh_s(a) = Dzh; 
    
        %ZTD
        ZTD_S(a) = Dzh_s(a)+ Dzw_s(a);
    end
        %Matriz conjunta
        Dzh_s = Dzh_s';
        Dzw_s = Dzw_s';
        ZTD_S = ZTD_S';
        Atraso_s = [Dzw_s,Dzh_s,ZTD_S];
        cd ('C:\Users\thain\Documents\BEPE\Dados de sa�da\Delay\Empirical'); %Salva dados no Excel
        xlswrite('mg_saast', Atraso_s); %Mudar aqui
end

%% Fun��o que calcula o atraso da componente hidrost�tica
function Zhd = Zhd_f_S(lat,h,P)
%Graus para radiano
rad2 = rad(lat);

D = (1+0.0026*cos(2*rad2) + 0.00028*h);
Zhd = 0.002277*D*P;
end

%% Fun��o que calcula o atraso da componente �mida
function Zwd = Zwd_f_S(lat,h,T,e)

%Graus para radiano
rad2 = rad(lat);

D = (1+0.0026*cos(2*rad2) + 0.00028*h);
Zwd = 0.002277*D*((1255/T)+0.05)*e;
end

%% Fun��o que dada a temperatura em Celsiu e a umidade relativa em % calcula
%a press�o parcial do vapor d'�gua em hPa

function [e] = Pression(f, T)
    %es = Press�o de Satura��o do Vapor d'�gua
    Es = 6.1078*10^((7.5*T)/(237.3+T));
    e = (f*Es)/100;
end


%% Converte Graus para Radiano

function radiano = rad(E)
radiano = (pi * E)/180;
end