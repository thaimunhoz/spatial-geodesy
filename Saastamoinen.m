function [] = Saastamoinen_Zenite()
    clear all
    clc
    lat = input('Digite o valor da latitude da estação em graus');
    h = input('Digite o valor da altitude da estação');
    cd ('C:\Users\thain\Documents\BEPE\Met_Par');
    Data = xlsread('Pluv_MG');
    h = h/1000;
    Temp = Data(:,5); %Temperatura do Bulbo Seco em Celsius
    Umid = Data(:,6); %Umidade relativa em porcentagem
    Press = Data(:,4); %Pressão parcial em Hpa

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
        cd ('C:\Users\thain\Documents\BEPE\Dados de saída\Delay\Empirical'); %Salva dados no Excel
        xlswrite('mg_saast', Atraso_s); %Mudar aqui
end

%% Função que calcula o atraso da componente hidrostática
function Zhd = Zhd_f_S(lat,h,P)
%Graus para radiano
rad2 = rad(lat);

D = (1+0.0026*cos(2*rad2) + 0.00028*h);
Zhd = 0.002277*D*P;
end

%% Função que calcula o atraso da componente úmida
function Zwd = Zwd_f_S(lat,h,T,e)

%Graus para radiano
rad2 = rad(lat);

D = (1+0.0026*cos(2*rad2) + 0.00028*h);
Zwd = 0.002277*D*((1255/T)+0.05)*e;
end

%% Função que dada a temperatura em Celsiu e a umidade relativa em % calcula
%a pressão parcial do vapor d'água em hPa

function [e] = Pression(f, T)
    %es = Pressão de Saturação do Vapor d'água
    Es = 6.1078*10^((7.5*T)/(237.3+T));
    e = (f*Es)/100;
end


%% Converte Graus para Radiano

function radiano = rad(E)
radiano = (pi * E)/180;
end