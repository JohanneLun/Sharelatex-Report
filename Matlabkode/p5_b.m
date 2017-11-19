% variance of measurement noise
load ('data.mat'); 
compass_data = data(2,:); %compass(deg)
mes_var = var(compass_data*pi/180); % Measurment noice in radians
