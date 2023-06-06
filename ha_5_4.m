

A = [1,-1,sin(sqrt(17)), log(sqrt(42)) ; 10,2,sqrt(73),-1/sqrt(73) ;
     14,-2,atan(sqrt(3)),sqrt(15) ; 21,0,exp(sqrt(2)), pi]

Z0 = [0,1 ; 1,0 ; 0,0 ; 0,0];

tol = 1e-8;

max_iter = 50;

[lam, iter] = subspace_iteration(A, Z0, tol, max_iter)