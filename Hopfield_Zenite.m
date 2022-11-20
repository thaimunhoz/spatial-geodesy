%C�lculo do atraso troposf�rico 
%Autor: Thainara Munhoz

function [] = Hopfield_Zenite()
    clear all
    clc
    lat = input('Digite o valor da latitude da esta��o em graus');
    cd ('C:\Users\thain\Documents\BEPE\Met_Par');
    Data = xlsread('Mbar.xls');

    Temp = Data(:,5); %Temperatura do Bulbo Seco em Celsius
    Umid = Data(:,6); %Umidade relativa em porcentagem
    Press = Data(:,4); %Press�o parcial em Hpa
       
    for a = 1:365
        T = Temp(a,1);
        f = Umid(a,1);
        P = Press(a,1);
        e = Pression(f, T);
        T = T+273.15;

        %ZHD = Fun��o que calcula o atraso causado pela componente hidrost�tica
        Zhd(a) = ZHD_f_H(P,T,lat);
       
        %ZWD = Fun��o que calcula o atraso causado pela componente umida
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

%% Fun��o que dada a temperatura em Celsiu e a umidade relativa em % calcula
%a press�o parcial do vapor d'�gua em hPa
function [e] = Pression(f, T)
    %es = Press�o de Satura��o do Vapor d'�gua
    Es = 6.1078*10^((7.5*T)/(237.3+T));
    e = (f*Es)/100;
end

%% ZHD
function Zhd=ZHD_f_H(P,T,lat)

%Converte graus para rad
%rad = fun��o para convers�o


Hd=40136+148.72*(T - 273.16);
Tzh=(155.2*10^(-7))*((P/T)*Hd);
%Mh = fun��o de mapeamento de Chao para a componente hidrost�tica
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