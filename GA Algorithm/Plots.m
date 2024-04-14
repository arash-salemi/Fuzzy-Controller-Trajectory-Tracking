clc;

% x = out.logsout{1}.Values.Data;
% y = out.logsout{2}.Values.Data;
% x_ref = squeeze(out.logsout{3}.Values.Data);
% y_ref = squeeze(out.logsout{4}.Values.Data);
% 
% plot(x,y);
% hold on;
% plot(x_ref,y_ref);


% % unicycle = unicycleKinematics("VehicleInputs","VehicleSpeedHeadingRate");
% 
% waypoints = [0,4,10; 0,-2,10];
% TimeOfArrival = [5,10];
% 
% trajectory = waypointTrajectory(waypoints,TimeOfArrival);
% 
% sampletime = [20];
% [position,orientation,velocity,acceleration,angularVelocity] = lookupPose(trajectory,sampletime);
% 
% %% figure(1)
% 
% line(waypoints(1,:),waypoints(2,:))

fis = readfis('FLC1');
figure(1)
subplot(2,2,1)
plotmf(fis,'input',1)
subplot(2,2,2)
plotmf(fis,'output',1)
subplot(2,2,3)
plotmf(fis,'input',2)
subplot(2,2,4)
plotmf(fis,'input',2)



