% Define DH parameters for ABB IRB 1200-7/0.7
L(1) = Link('d', 399, 'a', 0, 'alpha', -pi/2); % Link 1
L(2) = Link('d', 0, 'a', 350, 'alpha', 0);     % Link 2
L(3) = Link('d', 0, 'a', 42, 'alpha', -pi/2);  % Link 3
L(4) = Link('d', 351, 'a', 0, 'alpha', pi/2);  % Link 4
L(5) = Link('d', 0, 'a', 0, 'alpha', -pi/2);   % Link 5
L(6) = Link('d', 82, 'a', 0, 'alpha', 0);     % Link 6

% Create the robot model
IRB1200 = SerialLink(L, 'name', 'ABB IRB 1200-7/0.7');

adjustment = [0 -90 0 0 0 0];

% Target 1
q1 = ([-0.380000, -4.230000, -2.910000, -180.050000, -28.590000, -158.440000] + adjustment) * pi / 180;
T1 = IRB1200.fkine(q1);
disp('End-Effector Position (x, y, z) for Target 1:');
disp(T1.t');
%figure;
IRB1200.plot(q1);
axis([-1000 1000 -1000 1000 0 1000]); 
title('ABB IRB 1200-7/0.7 Robot Arm - Target 1');

% Target 2
q2 = ([-65.462272, 53.750286, 3.876018, 0.000000, 32.373696, -335.462272] + adjustment) * pi / 180;
T2 = IRB1200.fkine(q2);
disp('End-Effector Position (x, y, z) for Target 2:');
disp(T2.t');
%figure;
IRB1200.plot(q2);
axis([-1000 1000 -1000 1000 0 1000]); 
title('ABB IRB 1200-7/0.7 Robot Arm - Target 2');

% Target 3
q3 = ([0.007289, 48.025496, -24.229688, -0.058837, 65.024792, -338.048218] + adjustment) * pi / 180;
T3 = IRB1200.fkine(q3);
disp('End-Effector Position (x, y, z) for Target 3:');
disp(T3.t');
%figure;
IRB1200.plot(q3);
axis([-1000 1000 -1000 1000 0 1000]); 
title('ABB IRB 1200-7/0.7 Robot Arm - Target 3');

% Target 4
q4 = ([67.320000, 52.990000, 8.420000, -180.050000, -28.210000, -158.440000] + adjustment) * pi / 180;
T4 = IRB1200.fkine(q4);
disp('End-Effector Position (x, y, z) for Target 4:');
disp(T4.t');
%figure;
IRB1200.plot(q4);
axis([-1000 1000 -1000 1000 0 1000]); 
title('ABB IRB 1200-7/0.7 Robot Arm - Target 4');
