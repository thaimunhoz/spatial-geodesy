%Cálculo do atraso troposférico 
%Autor: Thainara Munhoz

function [] = Hopfield_Zenite()
    clear all
    clc
    lat = input('Digite o valor da latitude da estação em graus');
    cd ('C:\Users\thain\Documents\BEPE\Met_Par');
    Data = xlsread('Mbar.xls');

    Temp = Data(:,5); %Temperatura do Bulbo Seco em Celsius
    Umid = Data(:,6); %Umidade relativa em porcentagem
    Press = Data(:,4); %Pressão parcial em Hpa
       
    for a = 1:365
        T = Temp(a,1);
        f = Umid(a,1);
        P = Press(a,1);
        e = Pression(f, T);
        T = T+273.15;

        %ZHD = Função que calcula o atraso causado pela componente hidrostática
        Zhd(a) = ZHD_f_H(P,T,lat);
       
        %ZWD = Função que calcula o atraso causado pela componente umida
        Zwd(a) = ZWD_f_H(T,e,lat);
 
        %ZTD
       Ztd(a) = Zhd(a)+Zwd(a);

    end
    
    Zwd = Zwd';
    Zhd = Zhd';
    Ztd = Ztd';
    Atraso_h = [Zwd,Zhd,Ztd]
    cd ('C:\Users\thain\Documents\FAPESP\Artigo\Atraso\Hopfield'); %Salva dados no Excel
    xlswrite('MBAR_Hopfield', Atraso_h); %Mudar aqui
end

%% Função que dada a temperatura em Celsiu e a umidade relativa em % calcula
%a pressão parcial do vapor d'água em hPa
function [e] = Pression(f, T)
    %es = Pressão de Saturação do Vapor d'água
    Es = 6.1078*10^((7.5*T)/(237.3+T));
    e = (f*Es)/100;
end

%% ZHD
function Zhd=ZHD_f_H(P,T,lat)

%Converte graus para rad
%rad = função para conversão


Hd=40136+148.72*(T - 273.16);
Tzh=(155.2*10^(-7))*((P/T)*Hd);
%Mh = função de mapeamento de Chao para a componente hidrostática
Zhd=Tzh;
end

%% ZWD
function Res = ZWD_f_H(T,e,lat)



%Utiliza o valor absoluto da latitude
lat = abs(lat);
Hw = 11000-44.44*lat;
%aws = Tzw
aws = (155.2*10^(-7)) * ((4810 * e)/(T^2))*Hw;

Res = aws;
%disp(Mw)
end