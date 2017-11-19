function [y_est,b] = kalman(u,y,ks)
persistent init x_pri P_pri Ad Bd C Ed Q I R 

if isempty(init)
    %Initializing constants
    Ad=ks.Ad;   Bd=ks.Bd;   C=ks.C; Ed=ks.Ed;
    I=ks.I; R=ks.R; Q=ks.Q; 
    % Initializing first step
    x_pri = ks.x0_pri;
    P_pri = ks.P0_pri;
    % Making sure initializing only once
    init = 1;
end
% Calculating Kalman gain
K = P_pri*C'*inv(C*P_pri*C'+R);

% Updating the Kalman filter
x_post = x_pri+K*(y-C*x_pri);           % Update estimate with measurement
P_post = (I-K*C)*P_pri*(I-K*C)'+K*R*K'; % Update error covariance matrix

%Project ahead
x_pri = Ad*x_post+Bd*u;
P_pri = Ad*P_post*Ad'+Ed*Q*Ed';

% Setting the output
y_est = x_post(3);     b = x_post(5);
end