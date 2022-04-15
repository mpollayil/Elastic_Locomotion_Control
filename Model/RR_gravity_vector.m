function G = RR_gravity_vector(q, m1, m2, a1, a2)

% Basic params
g = 9.81;

% Manipulator params
l1=a1/2;
l2=a2/2;

Izz1 = (1/12)*m1*a1^2;
Izz2 = (1/12)*m2*a2^2;

% Gravity vector
G = [m1*g*l1*cos(q(1)) + m2*g*(a1*cos(q(1)) + l2*cos(q(1)+q(2)));
    m2*g*l2*cos(q(1)+q(2))];

end

