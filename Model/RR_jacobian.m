function J = RR_jacobian(q, a1, a2)

q1 = q(1);
q2 = q(2);

J = [-a2*sin(q1 + q2) - a1*sin(q1), -a2*sin(q1 + q2);
      a2*cos(q1 + q2) + a1*cos(q1),  a2*cos(q1 + q2)];

end

