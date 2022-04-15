%% ELASTIC LOCOMOTION CONTROL
clear all; clc;

if(~isdeployed)
  cd(fileparts(which(mfilename)));
end

addpath('./Model')
addpath('./Utils')
addpath('./QP')

% Robot Parameters
m1 = 1;
m2 = 0.5;
a1 = 1;
a2 = 1;

% Motor Properties
J1 = 0.75;
J2 = 1.25;
B = diag([J1, J2]);

% Underactuation
S = eye(2);         % No UA for now

% Elastic Properties
k1 = 1;
k2 = 1;
K = diag([k1, k2]);

Kbar = [-S.'*K*S, S.'*K;
    K*S, -K];

% Initial Conditions
% q0 = [-pi/2; pi/6];
q0 = [-pi/2; 0];
dq0 = [0; 0];
theta0 = [-pi/2; 0];
dtheta0 = [0; 0];

% Desired EE Trajectory/Point
r_d = [0; 0];

% Torque Control Gains
Kt = 10*eye(2);
Ks = 1*eye(2);

% PD Control Gains
Kp = 10*eye(2);
Kv = 1*eye(2);
