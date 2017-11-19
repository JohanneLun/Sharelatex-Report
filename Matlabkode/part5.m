%Part 5 
% c) 
R = mes_var/Ts;
P0_pri = [1 0 0 0 0; 0 0.013 0 0 0; 0 0 pi^2 0 0;
    0 0 0 1 0; 0 0 0 0 2.5e-3];
x0_pri = [0 0 0 0 0]';
Q = [30 0; 0 1e-6];
I = eye(5);
ks = struct('Ad',Ad,'Bd',Bd,'C',C,'Ed',Ed,'R',R,'Q',Q,'I',I,'P0_pri',P0_pri,'x0_pri',x0_pri);