function C = RR_coriolis_matrix(q, dq, m1, m2, a1, a2)

% Manipulator params
l1=a1/2;
l2=a2/2;

Izz1 = (1/12)*m1*a1^2;
Izz2 = (1/12)*m2*a2^2;

% Basic expressions for dynamics
Beta = m2*a1*l2;

% Coriolis matrix
C = [-Beta*sin(q(2))*dq(2), -Beta*sin(q(2))*(dq(1)+dq(2));
     Beta*sin(q(2))*dq(1),   0];

end

