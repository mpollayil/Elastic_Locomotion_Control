function dJ = RR_diff_jacobian(q, dq, a1, a2)

q1 = q(1);
q2 = q(2);
dq1 = dq(1);
dq2 = dq(2);

dJ = [-a2*cos(q1 + q2)*(dq1 + dq2)-a1*cos(q1)*dq1, -a2*cos(q1 + q2)*(dq1 + dq2);
    -a2*sin(q1 + q2)*(dq1 + dq2)-a1*sin(q1)*dq1, -a2*sin(q1 + q2)*(dq1 + dq2)];

end

