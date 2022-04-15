function [q_out] = RR_inverse_kinematics(xi_in, a1, a2, down_right)
% RR INVERSE KINEMATICS Performs inv. kin. of xi_in for an RR robot
% if down_right = true -> down right solution
% else -> up left solution
% Ref De Luca

% We suppose here that the point xi_in is inside robot ws (c2 in [-1, 1])
xi_x = xi_in(1);
xi_y = xi_in(2);

% Second joint angle computation
c2 = (xi_x^2 + xi_y^2 - a1^2 -a2^2)/(2*a1*a2);
if down_right
    s2 = sqrt(1 - c2^2);
else
    s2 = -sqrt(1 - c2^2);
end

q_out_2 = atan2(s2,c2);

% First joint angle computation
% q_out_1 = atan2(xi_y,xi_x) - atan2(a2*s2,a1+a2*c2);
num = xi_y*(a1 + a2*c2)-xi_x*a2*s2;
den = xi_x*(a1 + a2*c2)-xi_y*a2*s2;
q_out_1 = atan2(num,den);

% Setting output
q_out = [q_out_1; q_out_2];

end

