
function F = frechet_d (br,X,A,B)
  %function F = frechet_d (br,X,A,B)
  %calcola la derivata di frechet nel punto X
  t=1e-8;
  n=length(A(:,1));
  gX= (X-A)*expm(X);
  XmA=X-A;
for ii = 1:n
  for jj = 1:n
    
    H = zeros(n);
    H(jj,ii)=1;
    
    D=1/t*((XmA+t*H)*expm(X+t*H)-gX);
    F(:,(ii-1)*n+jj)=D(:);
  end
end

endfunction
