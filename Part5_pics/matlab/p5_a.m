Fs = 10; %Hz
Ts = 1/Fs;

% discretization
[Ad, Bd] = c2d(A,B,Ts); 
[Ad, Ed] = c2d(A,E,Ts); 