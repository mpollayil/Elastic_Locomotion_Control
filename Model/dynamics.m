function [M, C, G] = dynamics(q, dq, m1, m2, a1, a2)
% DYNAMICS Computes dynamic vectors/matrices

M = RR_mass_matrix(q, m1, m2, a1, a2);
C = RR_coriolis_matrix(q, dq, m1, m2, a1, a2);
G = RR_gravity_vector(q, m1, m2, a1, a2);

end