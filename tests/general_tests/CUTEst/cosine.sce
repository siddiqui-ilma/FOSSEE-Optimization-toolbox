// -------cosine.mod---------
/*
For N=10, in scilab
fval = -9.
 output  = 

  Iterations = 16
  Cpu_Time = 0.048
  Objective_Evaluation = 42
  Dual_Infeasibility = 0.0000003
  Message = "Optimal Solution Found"
For same N, on NEOS server:
fval = -9.0000000000000000e+00 (both scaled and unscaled)

For N=1000, in scilab
fval = -999.
 output  = 

  Iterations = 16
  Cpu_Time = 0.686
  Objective_Evaluation = 34
  Dual_Infeasibility = 0.0000003
  Message = "Optimal Solution Found"
For same N, on NEOS server:
fval = -9.9900000000000000e+02  (both scaled and unscaled)

*/
funcprot(0);
N = 1000; 
//N= 10000;
x0 = zeros(1,N);
x0(1,1:N) = 1;

function y=f(x)
    N = 1000; 
    i=1:(N-1);
    y=0;
    for i=(1:(N-1)) 
        y = y + (cos(-0.5.*x(1,i+1) + x(1,i).^2));
    end
endfunction

function g=fGrad(x)
    N = 1000;     
    g = zeros(N,1);
    i=2:(N-1); 
    for i=(2:(N-1)) 
        g(i,1) = g(i,1) + (0.5).*(sin(-0.5.*x(i) + x(i-1).^2)) - 2.*x(i).*(sin(-0.5.*x(i+1) + x(i).^2));
    end
    g(1,1) = (sin(0.5.*x(1+1) - x(1).^2)*2).*x(1);
    g(N,1) = (sin(0.5.*x(N) - x(N-1).^2)).*(-0.5);

endfunction

options = struct("MaxIter", [10000], "CpuTime", [6000], "GradObj", fGrad, "Hessian","off","GradCon","off","HessianApproximation",[1]);
[x,fval,exitflag,output] =fot_fmincon(f, x0,[],[],[],[],[],[],[],options)

