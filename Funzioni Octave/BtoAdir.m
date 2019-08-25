
function [Bc,Pj]= BtoAdir(A,B,p)
  %function [Bc,Pj]= BtoAdir(A,B,p)
  %proietta B nella direzione di A calcolata fino alla p esima potenza
  n=length(B(:,1));
  I=eye(n);
  
  if(p>n)
    p=n;
  endif
  
  Ta=I;
  V=Ta(:);
  
if(p==1)
  V=A(:);
  Pj=V*(V'*V)^(-1)*V';
  Bc=reshape(Pj*(B)(:),n,n);
  return
endif 
  
  
  for i=(2:p)
    Ta=Ta*A;
    V=[V,Ta(:)];
  endfor
  
  Pj=V*(V'*V)^(-1)*V';
  Bc=reshape(Pj*(B)(:),n,n);
  
endfunction
