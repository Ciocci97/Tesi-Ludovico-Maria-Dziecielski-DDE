
function [eigS,resS] = test1Eig (branch,A)
%function [eigS,resS] = test1Eig (branch,A)
%calcola gli autovalori con B=I

n= length(A(1,:));
I=eye(n);


eigA=eig(A);
Eqtest=@(s) det(s*I-A-I*exp(-s));
  for k=(1:n)
    eigS(k)= lambertw(branch,exp(-eigA(k)))+eigA(k);
    resS(k)=norm(Eqtest(eigS(k))/eigS(k));
  endfor
  

endfunction
