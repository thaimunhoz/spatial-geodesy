clc
clear all

d=uigetdir('','E:\BEPE\VMF1\ALIC'); %select the input-folder that contains the subfolders
cd(d);
list = dir;
list = list([list.isdir]); 
list = list(~ismember({list.name},{'.' '..'}));
l=length(list);
Coord = xlsread('IGS.xls');

IGS_height = Coord(1,7);
IGS_lat_deg = Coord(1,1);
IGS_lat_min = Coord(1,2); 
IGS_lat_sec = Coord(1,3); 

IGS_long_deg = Coord(1,4);
IGS_long_min = Coord(1,5);
IGS_long_sec = Coord(1,6);

IGS_lat = convdegminssecs(IGS_lat_deg,IGS_lat_min,IGS_lat_sec);
IGS_long = convdegminssecs(IGS_long_deg,IGS_long_min,IGS_long_sec);
%colocar lat MBAR negativa

a = 6378137;
f = 1/298.257222101;
b = a*(1-f);
e = (sqrt(a^2 - b^2))/a;
M = (a*(1-e^2))/((1-e^2*(sind(IGS_lat)^2))^(3/2));
N = a / ((1 - e^2*(sind(IGS_lat))^2)^(1/2));

for k=1:l
      oldfolder = cd(list(1).name);
      files = dir('*.par');
      baseFileName = files(1).name;
      fprintf(1,'Now reading %s\n',baseFileName)
      data = dlmread (baseFileName,'', 8,0);
      year = data(1,1);
      month = data(1,2);
      day = data(1,3);
      
      height = data(:,13);
      height = height(end);
      lat_deg = data(:,7);
      lat_min = data(:,8);
      lat_seg = data(:,9);
      
      long_deg = data(:,10);
      long_min = data(:,11);
      long_seg = data(:,12);
      
      lat_deg = lat_deg(end);
      lat_min = lat_min(end);
      lat_seg = lat_seg(end);
      
      long_deg = long_deg(end);
      long_min = long_min(end);
      long_seg = long_seg(end);
      
      LAT = convdegminssecs(lat_deg,lat_min,lat_seg);
      LONG = convdegminssecs(long_deg,long_min,long_seg);
      
      Dif_lat = M*rad(LAT - IGS_lat);
      Dif_long = N * cosd(IGS_lat) * rad(LONG - IGS_long);
      Dif_H = height - IGS_height;
      
      Coord(k,1) = year;
      Coord(k,2) = month;
      Coord(k,3) = day;
      Coord(k,4) = Dif_lat;
      Coord(k,5) = Dif_long;
      Coord(k,6) = Dif_H;
      
      clear year month day height lat_deg lat_min lat_seg long_deg long_min long_seg

      cd(oldfolder); 
end
cd ('E:\BEPE\Dados de saída\Coordenates\lat long\ecmwf - estimated'); %Salva dados no Excel
xlswrite('alic_ecmwf.xls', Delay); %Mudar aqui