function x_star = hierarchical_qp_solve_active_set(A, b)
% HIERARCHICAL_QP_SOLVE Solves a stack of QP tasks.
%
% (A,b)     -       Stack of pairs of task matrices (cell arrays)

% Variable size for codegen
coder.varsize('x_star');
coder.varsize('Zp');
% coder.varsize('Hp');
% coder.varsize('cp');

% Dimension check
if length(A) ~= length(b)
    error('The sizes of A and b do not match!');
end

% Initialization variables
n = size(A{1},2);
x_star = zeros(n,1);
xi0 = zeros(2*n,1);
Abar = [];
Zp = eye(n,n);

% Optimization options
options = optimoptions('quadprog','Algorithm','active-set');

% Iterate over tasks
for p = 1 : length(A)

    % Task dimensions and initialization
    m = size(Zp,2); 
    Ap = A{p}; bp = b{p};

    % QP Hessian and Gradient
    Hp = [Zp.'*(Ap.'*Ap)*Zp, zeros(m,m);
        zeros(m,m), eye(m,m)];
    cp = [Zp.'*Ap.'*(Ap*x_star - bp); zeros(m,1)];

    % Solution
    xi0 = zeros(size(Hp,1),1);
    xi_star = quadprog(Hp,cp,[],[],[],[],[],[],xi0,options);
    x_star = x_star + Zp*xi_star(1:m,:);

    % Update nullspace and guess
    Abar = [Abar; Ap];
    Zp = null(Abar,1e-6);

end

end