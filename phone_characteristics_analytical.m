% This file uses polynomial trajectory matrix for generating the position,
% velocity and acceleration characterstics of the handheld device. Every
% thing is represented in the absolute world frame i.e. (0,0)

global poly polyp polypp vec_T impactindex xstep1 xstep2
global vec_T1 vec_T2

m = size(poly);
xstart = 0;
for j=1:1:impactindex
    [x, z] = DGM_phone( poly(:,j)', xstart);
    xphone(j) = x;
    zphone(j) = z;
end
for j=impactindex+1:1:m(2)
    [x, z] = DGM_phone( poly(:,j)', xstep1);
    xphone(j) = x;
    zphone(j) = z;
end

figure;
hold on
plot(vec_T, xphone, 'r');
plot(vec_T, zphone);
xlabel('Time(s)');
ylabel('Coordinates(X,Z) of phone in space(metres)');
title('Position of phone vs time');
legend('X','Z');

for j=1:1:impactindex
    [dx, dz] = DKM_phone( poly(:,j)', polyp(:,j)');
    dxphone(j) = dx;
    dzphone(j) = dz;
end
for j=impactindex+1:1:m(2)
    [dx, dz] = DKM_phone( poly(:,j)', polyp(:,j)');
    dxphone(j) = dx;
    dzphone(j) = dz;
end

figure;
hold on
vel = sqrt(dxphone.^2 + dzphone.^2);
plot(vec_T, dxphone, 'r');
plot(vec_T, dzphone);
plot(vec_T, vel, 'g');
xlabel('Time(s)');
ylabel('Velocity(X,Z) of phone in space(m/s)');
title('Velocity of phone vs time');
legend('vx','vz','v');

for j=1:1:impactindex
    [ddx, ddz] = DDM_phone( poly(:,j)', polyp(:,j)', polypp(:,j)');
    ddxphone(j) = ddx;
    ddzphone(j) = ddz;
end
for j=impactindex+1:1:m(2)
    [ddx, ddz] = DDM_phone( poly(:,j)', polyp(:,j)', polypp(:,j)');
    ddxphone(j) = ddx;
    ddzphone(j) = ddz;
end

figure;
hold on
accn = sqrt(ddxphone.^2 + ddzphone.^2);
plot(vec_T, ddxphone, 'r');
plot(vec_T, ddzphone);
plot(vec_T, accn, 'g');
xlabel('Time(s)');
ylabel('Acceleration(X,Z) of phone in space(m/s^2)');
title('Acceleration of phone vs time');
legend('ax','az', 'a');

% 
% % figure;
% % pwelch(accn);
% 
% figure;
% hold on
% plot(vec_T,ytoe);
% plot(vec_T,yheel,'r');