clc
clear all
d=uigetdir('','C:\Users\thain\Documents\BEPE\NWP models\unbcmc_nest\thu3'); %select the input-folder that contains the subfolders
cd(d);
list = dir;
list = list([list.isdir]); 
list = list(~ismember({list.name},{'.' '..'}));
l=length(list);

for k=1:l
      oldfolder = cd(list(k).name);
      files = dir('*.par');
      baseFileName = files(1).name;
      fprintf(1,'Now reading %s\n',baseFileName)
      data = dlmread (baseFileName,'', 8,0);
      year = data(1,1);
      month = data(1,2);
      day = data(1,3);
      x = data(:,14);
      y = data(:,15);
      z = data(:,16);
      
      x_mean = x(end);
      y_mean = y(end);
      z_mean = z(end);
      
      Coord(k,1) = year;
      Coord(k,2) = month;
      Coord(k,3) = day;
      Coord(k,4) = x_mean;
      Coord(k,5) = y_mean;
      Coord(k,6) = z_mean;
      
      clear year month day x y y 

      cd(oldfolder); 
end
cd ('C:\Users\thain\Documents\BEPE\Dados de saída\Coordenates\XYZ'); %Salva dados no Excel
xlswrite('naus_vmf1_GAPS.xls', Coord); %Mudar aqui