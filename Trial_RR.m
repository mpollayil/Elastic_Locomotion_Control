%% Sim Matlab

init;

q = q0;
dq = dq0;
theta = theta0;
dtheta = dtheta0;
tau = [1; 1];

Ts = 1;

for t = 1 : 10
    % Compute dynamic matrices
    [M, C, G] = dynamics(q, dq, m1, m2, a1, a2);

    % State evolutions
    ddq = M\(S.'*K*(theta - q) - C*dq - G);
    ddtheta = B\(tau - K*(theta - q));

    % Integrate
    dq = dq0 + ddq*Ts;
    q = q0 + dq*Ts;
    dtheta = dtheta0 + ddtheta*Ts;
    theta = theta0 + dtheta*Ts;
    
    % Update Inital Conditions
    dq0 = dq; q0 = q;
    dtheta0 = dtheta; theta0 = theta;
end