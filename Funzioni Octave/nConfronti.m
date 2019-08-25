
function resfb = nConfronti (n,iter,coeff)
  %function [resfb,resfa] = nConfronti (n,iter,coeff) 
  %calcola la media di iter residui dei punti calcolati con AtoBdir con matrici random nxn moltiplicate per coeff 
for i=(1:iter)  
  A=rand(n)*(coeff);
  B=rand(n)*(coeff);
  
  resb=confrontoProjB(A,B,n);

  for j=(1:n)
    if(i==1)
      resfb{j}=resb{j};
    endif
    resfb{j}=(resfb{j}+resb{j})/2;
  endfor
endfor

endfunction
