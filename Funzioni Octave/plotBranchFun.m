

function retval = plotBranchFun (dwBr,upBr)
%function retval = plotBranchFun (dwBr,upBr)

fBr=@(x) -x*(cot(x))+i*x;
x_0=linspace(-pi+0.3,+pi-0.3,1000000);
x_k=linspace(2*pi+0.3,+3*pi-0.3,1000000);
figure(2)

hold on;
for k=(0:upBr)
  
  if(k==0)
    y=arrayfun(fBr,x_0);  
  else
    y=arrayfun(fBr,x_k);
    x_k=x_k+2*pi;
  endif
  
  plot(real(y),imag(y),"color","k","linewidth",1)
  
  
  hold on;
  
endfor

x_k=-(x_k-2*pi);

for k=(dwBr:-1)
  
  y=arrayfun(fBr,x_k);
  x_k=x_k+2*pi;
  
  plot(real(y),imag(y),"color","k","linewidth",1)
  hold on;
  
endfor
xl=linspace(-100,-1,3);
plot(xl,xl*0,"color","k","linewidth",1)

hold on;
endfunction
