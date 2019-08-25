
function Sk = metodo2DDE (branch,A,B,S0)
%Sk = metodo2DDE (branch,A,B,S0) ,metodo S=W(l,((S-A)^-1*B*S))) 
if(det(B)<1e-10)
  Sk=-1
  return
endif
figure(6)
%clf

  iter=200;


n=length(A(1,:)); 
I=eye(n);
p=4;
  Eq=@(Y) (Y-A)*expm(Y)-B;
  G1=@(S) lambertwmatrix(branch,((S-A)^-1*B*S));

 


  %se presente il parametro S0 parta da quello altrimenti chiama la funzione per ottenere S0 
   if(exist("S0")!=1)
   
      S0=-1;
      flagPar=true;
   endif
   

   if(or(flagPar,(length(S0(1,:))!=n)))
         if(p>n)
            p=n-1;
         endif
         As=AtoBdir(A,B,p);
         S0=lambertwmatrix(branch,B*expm(-As))+As;
         if(residuo(S0,A,B)>100)
             if(branch==0)
                S0=I;
             elseif (branch>0)
                S0=I*(-0.5+2*branch)*pi*i;
             elseif (branch<0)
                S0=I*(+0.5+2*branch)*pi*i;
             end
         endif
    
    end

  Sk{1}=S0;

  Eq=@(Y) (Y-A)*expm(Y)-B;
  G1=@(S) lambertwmatrix(branch,((S-A)^-1*B*S)); 
  
  %Iterazione
    for k=(1:iter)          
           if(isnan(Sk{k}))
               Sk{200}=zeros(n);
               return
            endif
          Sk{k+1}=G1(Sk{k});
          res(k)=norm(Eq(Sk{k+1}))/norm(Sk{k+1});
     endfor
    

    
    figure(1)
      
      semilogy(1:length(res),res,'LineWidth',2);
      axis([1 100 1e-15 1e+3])

      


return
endfunction