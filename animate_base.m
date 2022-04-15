%% PLOTS

close all;
clear L;
f = figure;
f.WindowState = 'maximized';
pause(0.1)

% Get data length
size_data = out.q_out.Length;

% Getting Vectors from Sim
q_out = reshape(out.q_out.Data,2,size_data);
t_out = out.tout.';

mean_t = mean(diff(t_out));

% post process
res = 0.1;
[t_sim, q_sim] = adjust_time(t_out,q_out,res);

% errors
h(1) = subplot(1,2,1);
hold on
plot(t_out,q_out(1,:));
plot(t_out,q_out(2,:));
legend('$q_1$','$q_2$','Interpreter','latex')
title('Link Positions')

% robot motion
h(2) = subplot(1,2,2);
hold on
axis equal
axis ([-0.5 2.5 -2.0 2.0])
grid on
title('Animation - Elastic RR Robot')

% initialize animation
L(1) = plot(0,0,'-ko','linewidth',2);
t_h = text(2.2,2.2,['(' num2str(0) ')']);
% t_xi = plot(xi_des_out(1,:),xi_des_out(2,:),'r');

for i=1:1:size(t_sim,2)
    
    delete(L(1))
    delete(t_h)
    
    t_h = text(2.2,2.2,['(' num2str(t_sim(i)) ')']);
    L(1)=plot_robot(q_sim(:,i),[a1;a2],1);
    legend(L, {'execution'})
    
    drawnow

    pause(mean_t);
    
end