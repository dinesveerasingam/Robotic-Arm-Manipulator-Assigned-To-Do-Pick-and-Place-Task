% Define DH parameters for ABB IRB 1200-7/0.7
L(1) = Link('d', 399, 'a', 0, 'alpha', -pi/2); % Link 1
L(2) = Link('d', 0, 'a', 350, 'alpha', 0);         % Link 2
L(3) = Link('d', 0, 'a', 42, 'alpha', -pi/2);      % Link 3
L(4) = Link('d', 351, 'a', 0, 'alpha', pi/2);       % Link 4
L(5) = Link('d', 0, 'a', 0, 'alpha', -pi/2);          % Link 5
L(6) = Link('d', 212, 'a', 0, 'alpha', 0);          % Link 6

% Create the robot model
IRB1200 = SerialLink(L, 'name', 'ABB IRB 1200-7/0.7');

% Define the desired end-effector pose (position + orientation)
% For example, a translation to [140, 450, 110] and orientation specified by a rotation matrix
T_desired = transl(186.991,447.368,239.583) * trotz(0) * troty(0) * trotx(0);

% Perform inverse kinematics to find the joint angles
q_solution = IRB1200.ikine(T_desired, 'mask', [1 1 1 0 0 0]);

% Convert joint angles to degrees
q_solution_deg = rad2deg(q_solution);

%convert to RoboDK angles
q_solution_deg=q_solution_deg+[0 90 0 0 0 0];

% Display the joint angles in degrees
disp('Joint Angles for the Desired Pose (in degrees):');
disp(q_solution_deg);

% Verify by calculating the forward kinematics for the solution
T_computed = IRB1200.fkine(q_solution);

% Display the computed end-effector position
disp('Computed End-Effector Position (x, y, z) for the Solution:');
disp(T_computed.t');

% Plot the robot arm using the calculated joint angles
figure;
IRB1200.plot(q_solution);

axis([-1000 1000 -1000 1000 0 1000]); % Adjust these limits according to your setup
grid on;

title('ABB IRB 1200-7/0.7 Robot Arm - Inverse Kinematics Solution');
