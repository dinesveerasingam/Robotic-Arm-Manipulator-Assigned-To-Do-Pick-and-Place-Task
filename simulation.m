% Define DH parameters for ABB IRB 1200-7/0.7
L(1) = Link('d', 399, 'a', 0, 'alpha', -pi/2); % Link 1
L(2) = Link('d', 0, 'a', 350, 'alpha', 0);     % Link 2
L(3) = Link('d', 0, 'a', 42, 'alpha', -pi/2);  % Link 3
L(4) = Link('d', 351, 'a', 0, 'alpha', pi/2);  % Link 4
L(5) = Link('d', 0, 'a', 0, 'alpha', -pi/2);   % Link 5
L(6) = Link('d', 212, 'a', 0, 'alpha', 0);     % Link 6

% Create the robot model
IRB1200 = SerialLink(L, 'name', 'ABB IRB 1200-7/0.7');

% Define the initial and final joint configurations0 -90 0 0 0 0
%Target0
q_0 = ([-0.380000, -4.230000, -2.910000, -180.050000, -28.590000, -158.440000] + [0 -90 0 0 0 0]) * pi/180;
%Target1
q_1 = ([-65.462272, 53.750286, 3.876018, 0.000000, 32.373696, -335.462272] + [0 -90 0 0 0 0]) * pi/180;
%Target2
q_2 = ([0.007289, 48.025496, -24.229688, -0.058837, 65.024792, -338.048218] + [0 -90 0 0 0 0]) * pi/180;
%Target4
q_3 = ([67.320000, 52.990000, 8.420000, -180.050000, -28.210000, -158.440000] + [0 -90 0 0 0 0]) * pi/180;

% Number of steps for the animation
steps = 30;

% Generate a trajectory between the start and end configurations
q_trajectory_0_1 = jtraj(q_0, q_1, steps); %target1 -> target2 (START)
q_trajectory_1_0 = jtraj( q_1,q_0, steps); %target2 -> target1
q_trajectory_0_2 = jtraj( q_0,q_2, steps); %target1 -> target3
q_trajectory_2_0 = jtraj( q_2,q_0, steps); %target3 -> target1
q_trajectory_0_3 = jtraj( q_0,q_3, steps); %target1 -> target4
q_trajectory_3_0 = jtraj( q_3,q_0, steps); %target4 -> target1 (END)

title('ABB IRB 1200-7/0.7 Robot Arm Forward Kinematics Animation');

% Animate the robot target0 -> target1
for i = 1:steps
    % Update the robot configuration
    IRB1200.plot(q_trajectory_0_1(i, :));
     % Set the axis range
    axis([-1000 1000 -1000 1000 0 1000]);
    pause(0.000001); % Pause to control the speed of the animation
end

% Animate the robot target1 -> target0
for i = 1:steps
    % Update the robot configuration
    IRB1200.plot(q_trajectory_1_0(i, :));
    axis([-1000 1000 -1000 1000 0 1000]);
    pause(0.000001); % Pause to control the speed of the animation
end

% Animate the robot target0 -> target2
for i = 1:steps
    % Update the robot configuration
    IRB1200.plot(q_trajectory_0_2(i, :));
    axis([-1000 1000 -1000 1000 0 1000]);
    pause(0.000001); % Pause to control the speed of the animation
end

% Animate the robot target2 -> target0
for i = 1:steps
    % Update the robot configuration
    IRB1200.plot(q_trajectory_2_0(i, :));
    axis([-1000 1000 -1000 1000 0 1000]);
    pause(0.000001); % Pause to control the speed of the animation
end

% Animate the robot target0 -> target2
for i = 1:steps
    % Update the robot configuration
    IRB1200.plot(q_trajectory_0_2(i, :));
    axis([-1000 1000 -1000 1000 0 1000]);
    pause(0.000001); % Pause to control the speed of the animation
end

% Animate the robot target2 -> target0
for i = 1:steps
    % Update the robot configuration
    IRB1200.plot(q_trajectory_2_0(i, :));
    axis([-1000 1000 -1000 1000 0 1000]);
    pause(0.000001); % Pause to control the speed of the animation
end

% Animate the robot target0 -> target3
for i = 1:steps
    % Update the robot configuration
    IRB1200.plot(q_trajectory_0_3(i, :));
    axis([-1000 1000 -1000 1000 0 1000]);
    pause(0.000001); % Pause to control the speed of the animation
end

% Animate the robot target3 -> target0
for i = 1:steps
    % Update the robot configuration
    IRB1200.plot(q_trajectory_3_0(i, :));
    axis([-1000 1000 -1000 1000 0 1000]);
    pause(0.000001); % Pause to control the speed of the animation
end





