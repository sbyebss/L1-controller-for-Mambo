%For the time series
deltaT=0.005;
Time_vertical=(0:deltaT:0.995)';
Time_circle=(1:deltaT:4.995)';

%For the Flying to 1m
Z_vertical=-(linspace(0,1,200))';
X_vertical=zeros(200,1);
Y_vertical=zeros(200,1);
xd_vertical=[X_vertical,Y_vertical,Z_vertical];

% Vx_vertical=zeros(200,1);
% Vy_vertical=zeros(200,1);
% Vz_vertical=

%For the circle
X_circle=sin(Time_circle*pi);
Y_circle=cos(Time_circle*pi)+1;
Z_circle=-ones(800,1);
xd_circle=[X_circle,Y_circle,Z_circle];

%For the total
xd=[xd_vertical;xd_circle];

% For the velocity 
N=size(xd,1);
for i=1:N-1
   vd(i,:)= (xd(i+1,:)-xd(i,:))/deltaT;
end
vd(N,:)=[0,0,0];

% For the acceleration
for i=1:N-1
   ad(i,:)= (vd(i+1,:)-vd(i,:))/deltaT;
end
ad(N,:)=[0,0,0];

% Create the time series
DataValues=[xd,vd,ad];
TimeValues=[Time_vertical;Time_circle];
Ref_position=timeseries(DataValues,TimeValues,'Name','Position');