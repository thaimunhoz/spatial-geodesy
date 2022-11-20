%Média dos parâmetros meteorológicos diários 
%Autor: Thainara Munhoz
clear all
clc
%Pasta onde estão os arquivos
myFolder = 'C:\Users\thain\Documents\BEPE\RTKlib\IGS_Produts\Parameters\paste';

% Obter uma lista de todos os arquivos na pasta com o padrão de nome de arquivo desejado.
theFiles = dir(fullfile(myFolder,'*.1*'));
tam = length(theFiles)

for k = 1:tam
    baseFileName = theFiles(k).name;
    fprintf(1,'Now reading %s\n',baseFileName)  
    data = dlmread (baseFileName, '', 18,0);
    year = data(1,1);
    month = data(1,2);
    day = data(1,3);
    pression = data(:,7);
    temp = data(:,8);
    humid = data(:,9);
    pression(pression == 0) = NaN;
    temp(temp == 0) = NaN;
    humid(humid == 0) = NaN;
   
    pression(any(isnan(pression), 2), :) = [];
    temp(any(isnan(temp), 2), :) = [];
    humid(any(isnan(humid), 2), :) = [];
    
    %média de cada parâmetro
    m_p = mean(pression);
    m_t = mean(temp);
    m_h = mean(humid);
    year_p = mean(year);
    month_p = mean(month);
    day_p = mean(day);
    
    par(k,1) = year;
    par(k,2) = month;
    par(k,3) = day;
    par(k,4) = m_p;
    par(k,5) = m_t;
    par(k,6) = m_h; 
    clear year month day pression temp humid
   
end

cd ('C:\Users\thain\Documents\BEPE\Met_Par'); %Salva dados no Excel
xlswrite('thur3.xls', par); %Mudar aqui