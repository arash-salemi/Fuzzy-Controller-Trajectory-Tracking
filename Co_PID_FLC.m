clc;
clear; 
close all;

%% Run Simulink

mdl = 'FLC_PID1';
open_system(mdl)
fis = readfis('FLC');
sim(mdl)

%% Plot Tracking error (control effort - plant output XY)

x_ref = squeeze(ans.Xref);
y_ref = squeeze(ans.Yref);
x_output_FLC = squeeze(ans.Xoutput_FLC);
y_output_FLC = squeeze(ans.Youtput_FLC);
x_output_PID = squeeze(ans.Xoutput_PID);
y_output_PID = squeeze(ans.Youtput_PID);


figure(1)
plot(x_ref, y_ref,'b','linewidth',2)
hold on
plot(x_output_PID,y_output_PID,'r','linewidth',1)
title('Comparison Control effort with reference')
ylabel('Y Axis')
xlabel('X Axis')
ylim([-3,11])
xlim([0,11])
legend(["Reference" "PID-Output"])

figure(2)
plot(x_ref, y_ref,'b','linewidth',2)
hold on
plot(x_output_FLC, y_output_FLC,'r','linewidth',1)
title('Comparison Control effort with reference')
ylabel('Y Axis')
xlabel('X Axis')
ylim([-3,11])
xlim([0,11])
legend(["Reference" "FLC-Output"])

figure(3)
plot(x_ref, y_ref,'b','linewidth',2)
hold on
plot(x_output_FLC, y_output_FLC,'r','linewidth',1)
hold on
plot(x_output_PID, y_output_PID,'y','linewidth',1)
title('Comparison Controllers')
ylabel('Y Axis')
xlabel('X Axis')
ylim([-3,11])
xlim([0,11])
legend(["Reference" "FLC-Output" "PID-Output"])



%% Plot Control signal including Vehicle speed and Steering angle

% t = 0:19/1200:19;
t = ans.tout;
VehicleSpeed_FLC = squeeze(ans.VehicleSpeed_FLC);
SteeringAngle_FLC = squeeze(ans.SteeringAngle_FLC);
VehicleSpeed_PID = squeeze(ans.VehicleSpeed_PID);
SteeringAngle_PID = squeeze(ans.SteeringAngle_PID);


figure(4)
plot(t, VehicleSpeed_PID,'g','linewidth',1)
title('Control Signal (Vehicle Speed)')
ylabel('Vehicle Speed (m/s)')
xlabel('t (seconds)')
ylim([-0.1,3.1])
xlim([0,12])
legend('VehicleSpeedPID')

figure(5)
plot(t, VehicleSpeed_FLC,'g','linewidth',1)
title('Control Signal (Vehicle Speed)')
ylabel('Vehicle Speed (m/s)')
xlabel('t (seconds)')
ylim([-0.1,3.1])
xlim([0,12])
legend('VehicleSpeedFLC')

figure(6)

plot(t, SteeringAngle_PID,'b','linewidth',1)
title('Control Signal (SteeringAngle)')
ylabel('SteeringAngle (rad)')
xlabel('t (seconds)')
xlim([0,12])
legend('SteeringAnglePID')

figure(7)

plot(t, SteeringAngle_FLC,'b','linewidth',1)
title('Control Signal (SteeringAngle)')
ylabel('SteeringAngle (rad)')
xlabel('t (seconds)')
legend('SteeringAngleFLC')

figure(8)

plot(t, VehicleSpeed_FLC,'g','linewidth',1)
hold on;
plot(t, VehicleSpeed_PID,'y','linewidth',1)
title('Control Signal (Vehicle Speed)')
ylabel('Vehicle Speed (m/s)')
xlabel('t (seconds)')
ylim([-0.1,3.1])
xlim([0,12])
legend(["VehicleSpeedFLC" "VehicleSpeedPID"])

figure(9)

plot(t, SteeringAngle_FLC,'b','linewidth',0.5)
hold on;
plot(t, SteeringAngle_PID,'r--','linewidth',0.5)
title('Control Signal (SteeringAngle)')
ylabel('SteeringAngle (rad)')
xlabel('t (seconds)')
legend(["SteeringAngleFLC" "SteeringAnglePID"])

%% Heading Angle 

HeadingAngleOutput_FLC = squeeze(ans.HeadingAngleOut_FLC);
HeadingAngleOutput_PID = squeeze(ans.HeadingAngleOut_PID);

figure(10)

plot(t,HeadingAngleOutput_PID,'g','linewidth',1)
title('Plant Output (Heading Angle)')
ylabel('Heading Angle (rad)')
xlabel('t (seconds)')
legend('HeadingAngleOutputPID')

figure(11)

plot(t,HeadingAngleOutput_FLC,'g','linewidth',1)
title('Plant Output (Heading Angle)')
ylabel('Heading Angle (rad)')
xlabel('t (seconds)')
legend('HeadingAngleOutputFLC')

figure(12)

plot(t,HeadingAngleOutput_FLC,'g','linewidth',1)
hold on
plot(t,HeadingAngleOutput_PID,'y--','linewidth',1)
title('Plant Output (Heading Angle)')
ylabel('Heading Angle (rad)')
xlabel('t (seconds)')
xlim([0,12])
legend(["HeadingAngleFLC" "HeadingAnglePID"])


