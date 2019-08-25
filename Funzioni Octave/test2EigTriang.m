

function [eigS,resS] = test2EigTriang (branch,A,B)
%function [eigS,resS] = test2EigTriang (branch,A,B)
%Calcola gli atuovalori con A e B triangolari

n= length(A(1,:));
I=eye(n)
if ((!istriu(A))&&(!istriu(B)))
  return
endif

eigA=eig(A);
eigB=eig(B);


Eqtest=@(s) det(s*I-A-B*exp(-s));
  for k=(1:n)
    eigS(k)= lambertw(branch,eigB(k)*exp(-eigA(k)))+eigA(k);
    resS(k)=norm(Eqtest(eigS(k))/eigS(k));
  endfor
  

endfunction
