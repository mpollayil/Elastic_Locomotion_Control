function [p, J, dJ] = kinematics(q, dq, a1, a2)
% KINEMATICS Computes kinematic vectors/matrices

[~, ~, p] = RR_forward_kinematics(q, a1, a2);
J = RR_jacobian(q, a1, a2);
dJ = RR_diff_jacobian(q, dq, a1, a2);

end