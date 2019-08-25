
function [S,A,B] = randM (n,coeff)
%function [S,A,B] = randM (n,coeff)
  for k=(1:3)
     D=diag(rand(n,1)*(coeff)+rand(n,1)*coeff*i);
     P=rand(n,n)*(coeff)+rand(n,n)*coeff*i;
     X{k}=P*D*P^-1;
  endfor
  S=X{1};
  A=X{2};
  B=X{3};

endfunction
