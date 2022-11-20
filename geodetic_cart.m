function [X] = geodetic_cart( Geo, axis )
%
% Converter Geodetic coordinates to Cartesian coordinates 
%on Triaxial Ellipsoid or Biaxial Ellipsoid or Sphere
%
%   (x/a)^2+(y/b)^2+(z/c)^2=1   Triaxial Ellipsoid Equation
%    Geodetic To Cartesian B L h ==> x y z
% Parameters:
% Geo,[B,L,h]  -  Geodetic coordinates [latitude(deg);longitude(deg);ellipsoidal height(m)]
% 
% * axis,[a; b; c] - ellipsoid radii  [a; b; c],its axes % along [x y z] axes
%  
%                  For Triaxial ellipsoid ,it must be a > b > c
%
%                  For Biaxial ellipsoid ,it must be a = b > c
%
%                  For Sphere ,it must be a = b = c
%
% Output:
% * X, [x y z]     - Cartesian coordinates data, n x 3 matrix or three n x 1
% vectors
% 
%
% Author :
% Sebahattin Bektas, 19 Mayis University, Samsun
% sbektas@omu.edu.tr
format long
ro=180/pi; % converter Degree to radian
a=axis(1);b=axis(2);c=axis(3);
   
fi=Geo(1);l=Geo(2);h=Geo(3);
   
display('a             b                 c                semi axis')
fprintf(' %15.4f %15.4f %15.4f   \n',a,b,c)
display(' G E O D E T ? C     C O O R D ? N A T E S         ')
display('Latitude(fi)          Longitude (l)       ellipsoidal height (h)')
fprintf(' %18.8f %18.8f %18.3f   \n',fi,l,h)
 ex2=(a^2-c^2)/a^2;
 ee2=(a^2-b^2)/a^2;
V=a/sqrt(1-ex2*sin(fi/ro)^2-ee2*cos(fi/ro)^2*sin(l/ro)^2);
x=(V+h)*cos(l/ro)*cos(fi/ro);
y=(V*(1-ee2)+h)*sin(l/ro)*cos(fi/ro);
z=(V*(1-ex2)+h)*sin(fi/ro);
display(' C A R T E S ? A N     C O O R D ? N A T E S         ')   
display('X                     Y                           Z         ')
 fprintf('  %15.4f %15.4f %15.4f    \n',x,y,z) 
X=[x y z];
end