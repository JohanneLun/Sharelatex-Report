function [phi,b] = kalman(r,cm, ks)
persistent init x_pri P_pri y_pri Ad Bd C Ed Q I R 

if isempty(init)
    %Initializing constants
    Ad=ks.Ad;   Bd=ks.Bd;   C=ks.C; Ed=ks.Ed;
    I=ks.I; R=ks.R; Q=ks.Q; y_pri=ks.y_pri;
    % Initializing first step
    P_pri = ks.P0_pri;
    x_pri = ks.x0_pri;
    % Making sure initializing only once
    init = 1;
end
% Updating the Kalman filter
K_post = P_pri*C'*inv(C*P_pri*C'+R);
x_post = x_pri+K_post*(cm-y_pri);
P_post = (I-K_post*C)*P_pri*(I-K_post*C)'+K_post*R*K_post';

%Project ahead
P_pri = Ad*P_post*Ad'+Ed*Q*Ed';
x_pri = Ad*x_post+Bd*r;
y_pri = C*x_post;

% Setting the output
phi = x_post(3);     b = x_post(5);
end