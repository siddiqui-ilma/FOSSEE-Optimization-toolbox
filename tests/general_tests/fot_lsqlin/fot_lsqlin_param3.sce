// Check for the correct name of param
C = [2 0;
	-1 1;
	 0 2]
d = [1
	 0
    -1];
A = [10 -2;
	 -2 10];
b = [4
    -4];
param = list("Iter",300);

//Error
//fot_lsqlin: Unrecognized parameter name 'Iter'.
//at line     180 of function fot_lsqlin called by :  
//[xopt,resnorm,residual,exitflag,output,lambda] = fot_lsqlin(C,d,A,b,[],[],[],[],[],param)

[xopt,resnorm,residual,exitflag,output,lambda] = fot_lsqlin(C,d,A,b,[],[],[],[],[],param)

