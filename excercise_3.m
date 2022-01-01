%Assignment 3
%Task 2
%Convertion of Cartesian Coordinates to Spherical Coordinates.
% xber = (3782970.10 902154.92 5038375.59) m
clc;
clear all;
format long;
x1=3782970.10; %m
y1=902154.92;  %m
z1=5038375.59; %m
%%Convertion of Cartesian Coordinates to Spherical Coordinates 1.
[r1,lambda1,phi1]=car2sph(x1,y1,z1);

% Convertion of Spherical Coordinates to Cartesian Coordinates 1.

[x2,y2,z2]=sph2car(r1,lambda1,phi1);

%Convertion of Cartesian Coordinates to Spherical Coordinates 2.

[r2,lambda2,phi2]=car2sph(x2,y2,z2);


%Differences between cartesian coordinates 
dx = x1 - x2;
dy = y1 - y2;
dz = z1 - z2;


%Differences between Spherical Coordinates
drad = r1 - r2;
dlam = lambda1 - lambda2;
dlam=rad2deg(dlam);
dphi = phi1 - phi2;
dphi=rad2deg(dphi);


%Assignment 3
%Task 3
%xber = (3782970.10 902154.92 5038375.59) m
% Task3.a
clc;clear all;close all;
format long;
X1=3782970.10;
Y1=902154.92;
Z1=5038375.59;
% 1--- BESSEL
% 2----WGS 84
% 3----GRS 80
[B1,L1,h1]=car2geo(X1,Y1,Z1,3); %GRS 80
B1=rad2deg(B1); %degree
L1=rad2deg(L1); %degree

%Convert from Geodetic to Cartesian Coordinate

ellipsoid = referenceEllipsoid('GRS 80');
[X2,Y2,Z2] = geodetic2ecef(ellipsoid,B1,L1,h1,"degrees");
Xdiff_car=X2-X1;%the differences between two cartesian coordinates
Ydiff_car=Y2-Y1;%the differences between two cartesian coordinates
Zdiff_car=Z2-Z1;%the differences between two cartesian coordinates

[B2,L2,h2]=car2geo(X2,Y2,Z2,3);% converts again from cartesian to the geodetic coordinates
B2=rad2deg(B2);
L2=rad2deg(L2);
Bdiff_geo=B2-B1; %differences between two geodetic coordinates
Ldiff_geo=L2-L1; %differences between two geodetic coordinates
hdiff_geo=h2-h1; %differences between two geodetic coordinates
% Result; there is no difference between the geodetic coordinates
%Task3.b
[B_GRS80,L_GRS80,h_GRS80]=car2geo(X1,Y1,Z1,3); %converts cartesians coordinates to geodetic refering to GRS80
B_GRS80=rad2deg(B_GRS80);%degree
L_GRS80=rad2deg(L_GRS80);%degree
[B_WGS84,L_WGS84,h_WGS84]=car2geo(X1,Y1,Z1,2); %converts cartesians coordinates to geodetic refering to WGS84
B_WGS84=rad2deg(B_WGS84);%degree
L_WGS84=rad2deg(L_WGS84);%degree
[B_BES,L_BES,h_BES]=car2geo(X1,Y1,Z1,1); %converts cartesians coordinates to geodetic refering to BESSEL
B_BES=rad2deg(B_BES);%degree
L_BES=rad2deg(L_BES);%degree
%Ratios GRS80-WGS84
diff_B_GRS80_WGS_84 = ((B_WGS84-B_GRS80)/B_GRS80)*100;
diff_L_GRS80_WGS_84 = ((L_WGS84-L_GRS80)/L_GRS80)*100;
diff_h_GRS80_WGS_84 = ((h_WGS84-h_GRS80)/h_GRS80)*100;

%Ratios GRS80-BESSEL
diff_B_GRS80_BES= ((B_BES-B_GRS80)/B_GRS80)*100;
diff_L_GRS80_BES= ((L_BES-L_GRS80)/L_GRS80)*100;
diff_h_GRS80_BES= ((h_BES-h_GRS80)/h_GRS80)*100;



%TASK 4
clc;clear all;

X1=3782970.10;
Y1=902154.92;
Z1=5038375.59;
% GEODETIC COORDINATES IN DIFFERENT REFERANCE ELLIPSOID
[B1,L1,h1]=car2geo(X1,Y1,Z1,1); %BESSEL
B1=rad2deg(B1);L1=rad2deg(L1);% degree

[B2,L2,h2]=car2geo(X1,Y1,Z1,2); %WGS 84
B2=rad2deg(B2);L2=rad2deg(L2); %degree

[B3,L3,h3]=car2geo(X1,Y1,Z1,3); %GRS 80
B3=rad2deg(B3);L3=rad2deg(L3); %degree

% SPHERICAL COORDINATES 
[r1,lambda1,phi1]=car2sph(X1,Y1,Z1);
h4=r1-6371;
lambda1=rad2deg(lambda1);
phi1=rad2deg(phi1);

% Differences
dB_bessel=B1-phi1;%sph-Bessel
dL_bessel=L1-lambda1;
dB_wgs=B2-phi1; %sph-wgs84
dL_wgs=L2-lambda1;
dB_grs=B3-phi1;
dL_grs=L3-lambda1; %sph-grs80

%Compare
dB_bessel/phi1;
dB_wgs/phi1;
dB_grs/phi1;
% for latitude, BESSEL is locally closest to the sphere;
% for longitude, all are same to the sphere
%for h height, all of them are far away from sphere, but WGS 84 is much closer


%TASK 5
clc;
clear all;
%ITRF 2008 Epoch 2005
%7205
X7205_2005=1492404.605;
Y7205_2005=-4457266.520;
Z7205_2005=4296881.795;
Vx7205_2005=-0.0155;
Vy7205_2005=-0.0012;
Vz7205_2005=0.0041;
%7224
X7224_2005=4075539.757;
Y7224_2005=931735.399;
Z7224_2005=4801629.449;
Vx7224_2005=-0.0160;
Vy7224_2005=0.0171;
Vz7224_2005=0.0101;
%7232
X7232_2005=5085442.772;
Y7232_2005=2668263.635;
Z7232_2005=-2768696.876;
Vx7232_2005=-0.0015;
Vy7232_2005=0.0196;
Vz7232_2005=0.0165;


%7205 --Epoch 2000
X7205_2000=X7205_2005+Vx7205_2005*(2005.0-2000.0);
Y7205_2000=Y7205_2005+Vy7205_2005*(2005.0-2000.0);
Z7205_2000=Z7205_2005+Vz7205_2005*(2005.0-2000.0);
%7224 --Epoch 2000
X7224_2000=X7224_2005+Vx7224_2005*(2005.0-2000.0);
Y7224_2000=Y7224_2005+Vy7224_2005*(2005.0-2000.0);
Z7224_2000=Z7224_2005+Vz7224_2005*(2005.0-2000.0);

%7232 --Epoch 2000
X7232_2000=X7232_2005+Vx7232_2005*(2005.0-2000.0);
Y7232_2000=Y7232_2005+Vy7232_2005*(2005.0-2000.0);
Z7232_2000=Z7232_2005+Vz7232_2005*(2005.0-2000.0);

%ITRF 2005 Epoch 2000
%7205
X7205_2005_=1492404.683;
Y7205_2005_=-4457266.515;
Z7205_2005_=4296881.775;
%7224
X7224_2005_=4075539.836;
Y7224_2005_=931735.313;
Z7224_2005_=4801629.400;
%7232
X7232_2005_=5085442.779;
Y7232_2005_=2668263.544;
Z7232_2005_=-2768696.963;
%differences
delta_X1=[(X7205_2005_-X7205_2000);(Y7205_2005_-Y7205_2000);(Z7205_2005_-Z7205_2000)];
delta_X2=[(X7224_2005_-X7224_2000);(Y7224_2005_-Y7224_2000);(Z7224_2005_-Z7224_2000)];
delta_X3=[(X7232_2005_-X7232_2000);(Y7232_2005_-Y7232_2000);(Z7232_2005_-Z7232_2000)];
l=[delta_X1;delta_X2;delta_X3];

A = [ 1, 0, 0, X7205_2000, 0,Z7205_2000, -Y7205_2000;
      0, 1, 0, Y7205_2000, -Z7205_2000, 0, X7205_2000;
      0, 0, 1, Z7205_2000, Y7205_2000, -X7205_2000, 0; 
      1, 0, 0, X7224_2000, 0, Z7224_2000, -Y7224_2000;
      0, 1, 0, Y7224_2000, -Z7224_2000, 0, X7224_2000;
      0, 0, 1, Z7224_2000, Y7224_2000, -X7224_2000, 0; 
      1, 0, 0, X7232_2000, 0, Z7232_2000, -Y7232_2000;
      0, 1, 0, Y7232_2000, -Z7232_2000, 0, X7232_2000;
      0, 0, 1, Z7232_2000, Y7232_2000, -X7232_2000, 0; ];
Teta = (inv( A' * A )) * A' * l ;
T = [ (Teta(1,1)); (Teta(2,1)); (Teta(3,1))];

D = Teta(4,1);
R = [ 0, - (Teta(7,1)), (Teta(6,1));
     (Teta(7,1)), 0 , - (Teta(5,1));
    -(Teta(6,1)), (Teta(5,1)), 0 ];

% 7242 ITRF 2008
X7242_2005=-3950237.046;
Y7242_2005=2522347.621;
Z7242_2005=-4311562.205;

% Results of Computed 7242
X7242_2005_T= X7242_2005 + T +D*X7242_2005 + R *X7242_2005;
Y7242_2005_T= Y7242_2005 + T +D*Y7242_2005 + R *Y7242_2005;
Z7242_2005_T= Z7242_2005 + T +D*Z7242_2005 + R *Z7242_2005;

% Given Coordinates of 7242 
X7242_2005_G=-3950236.859;
Y7242_2005_G=2522347.586;
Z7242_2005_G=-4311562.417;


%Differences of Given and computed Coordinates of 7242
X7242_END=X7242_2005_T-X7242_2005_G;
Y7242_END=Y7242_2005_T-Y7242_2005_G;
Z7242_END=Z7242_2005_T-Z7242_2005_G;




