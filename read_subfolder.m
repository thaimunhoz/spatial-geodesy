clc
clear all
d=uigetdir('','C:\Users\thain\Documents\BEPE\NWP models\unb3m_nest\thu3'); %select the input-folder that contains the subfolders
cd(d);
list = dir;
list = list([list.isdir]); 
list = list(~ismember({list.name},{'.' '..'}));
l=length(list);

for k=1:l
      oldfolder = cd(list(k).name);
      files = dir('*.nad');
      baseFileName = files(1).name;
      fprintf(1,'Now reading %s\n',baseFileName)  
      data = dlmread (baseFileName, '', 10,0);
      year = data(1,1);
      month = data(1,2);
      day = data(1,3);
      ZHD = data(:,7);
      ZWD = data(:,8);
      ZTD = data(:,9);
      
      zhd_mean = ZHD(end);
      zwd_mean = ZWD(end);
      ztd_mean = ZTD(end);
      
      Delay(k,1) = year;
      Delay(k,2) = month;
      Delay(k,3) = day;
      Delay(k,4) = zhd_mean;
      Delay(k,5) = zwd_mean;
      Delay(k,6) = ztd_mean;
      
      clear year month day ZHD ZWD ZTD 

      cd(oldfolder); 
end
% cd ('C:\Users\thain\Documents\BEPE\Dados de saída\Delay\UNB3m'); %Salva dados no Excel
% xlswrite('NAUS_unb3m.xls', Delay); %Mudar aqui