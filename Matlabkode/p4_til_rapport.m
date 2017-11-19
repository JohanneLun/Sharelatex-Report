%Part 4
	A = [0 1 0 0 0; -w_0^2 -2*lambda*w_0 0 0 0 ;
		 0 0 0 1 0; 0 0 0 -1/T -K/T; 0 0 0 0 0;]; 
	B = [0 0 0 K/T 0]'; 
	E = [0 0; K_w 0; 0 0; 0 0; 0 1]; 
	C = [ 0 1 1 0 0]; 

% No distubance 
	A_b = [0 1; 0 -1/T]; 
	B_b = [0 K/T]'; 
	C_b = [1 0]; 
	obs_b = obsv(A_b, C_b); 
	rank(obs_b);

%With current 
	A_c = [0 1 0; 0 -1/T -K/T; 0 0 0;]; 
	B_c = [0 K/T 0]';
	E_c = [ 0 0; 0 0; 0 1]; 
	C_c = [1 0 0];  
	obs_c = obsv(A_c, C_c);
	rank(obs_c); 

%With wave disturbance
	A_d =  [0 1 0 0; -w_0^2 -2*lambda*w_0 0 0 ;
    		0 0 0 1; 0 0 0 -1/T;]; 
	c_d = [0 1 1 0]; 
	obs_d = obsv(A_d, c_d);
	rank(obs_d);

%With current and wave disturbance 
	obs_d = obsv(A,C);
	rank(obs_d);