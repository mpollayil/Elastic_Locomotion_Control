%% Hierarchical QP trial
clear all; clc;
addpath('../')

%% Initialization
init;       % To get basic parameters

% Random configurations
q = rand*q0;
dq = rand*dq0;
theta = rand*theta0;
dtheta = rand*dtheta0;

% Dynamic and Kinematic Matrices
[p, J, dJ] = kinematics(q, dq, a1, a2);
[M, C, G] = dynamics(q, dq, m1, m2, a1, a2);

% Getting Sizes
n = size(M,1);
nj = size(B,1);
m = size(J,1);

%% Tasks Definitions

% Dynamics Compensation
A1 = [M, zeros(n,nj);
    zeros(nj,nj), B];
A1 = [A1, [zeros(nj,nj); -S.']]; 	% Required for proper concatenation.

b1 = Kbar*[q; theta] - blkdiag(C, zeros(nj,n))*[dq; dtheta] - [G; zeros(nj,1)];

% Constraint Compliance
A2 = [J, zeros(m,nj), zeros(m,nj)];
b2 = -dJ*dq;

% Reducing second task size
A2 = A2(1,:); b2 = b2(1,:);

% Stack of tasks
A = {A1, A2};
b = {b1, b2};

%% Hierarchical QP
tic
x_star = hierarchical_qp_solve(A, b)
toc
tic
x_star_ = hierarchical_qp_solve_active_set(A, b)
toc

%% Verify Solution
A1*x_star - b1
A2*x_star - b2
A1*x_star_ - b1
A2*x_star_ - b2
