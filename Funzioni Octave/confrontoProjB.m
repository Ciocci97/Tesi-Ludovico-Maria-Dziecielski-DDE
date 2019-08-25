
function res= confrontoProjB (A,B,p)
  %function res= confrontoProjB (A,B,p)
  %confronta i resiudio per ogni potenza
Eq=@(S) S-A-B*expm(-S);
fComm=@(As) lambertwmatrix(0,B*expm(-As))+As;
 
  n=length(B(:,1));
  I=eye(n);
  
  if(p>n)
    p=n;
  endif
 
 
for k=(1:p)
  Ac=AtoBdir(A,B,k);
  Ss=fComm(Ac);
  rest=norm(Eq(Ss))/norm(Ss);
  res{k}=rest;
endfor
endfunction
