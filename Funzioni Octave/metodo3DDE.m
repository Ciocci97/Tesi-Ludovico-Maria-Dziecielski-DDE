
function Sk = metodo3DDE (branch,A,B,S0,iter)
  %Sk = metodo3DDE (branch,A,B,S0,iter) metodo S=W(l,(A*expm(S)+B)) proiezione iniziale
  
figure(1)
%clf
n=length(A(1,:)); 
I=eye(n);

  if(exist("iter")!=1)
    iter=100;
  endif

  Eq=@(Y) (Y-A)*expm(Y)-B;
  G1=@(S) lambertwmatrix(branch,(A*expm(S)+B));

 

  %se presente il parametro S0 parta da quello altrimenti chiama la funzione per ottenere S0 
  flagPar=false;
  if(exist("S0")!=1)
   
      S0=-1;
      flagPar=true;
   endif
   
   %PRIMO PUNTO INIZIALE
   
   if(or(flagPar,(length(S0(1,:))!=n)))
         As=Lagrange_interp(A,B);
            S0=lambertwmatrix(branch,B*expm(-As))+As;   
    end
    
    
    %SECONDO PUNTO INIZIALE
    #{ 
    if(or(flagPar,(length(S0(1,:))!=n)))
         if(branch==0)
            S0=I;
         elseif (branch>0)
            S0=I*(-0.5+2*branch)*pi*i;
         elseif (branch<0)
            S0=I*(+0.5-2*branch)*pi*i;
         end
    end
    #}
  Sk{1}=S0;
  
  F=frechet_d(branch,S0,A,B);
  P=proiezioneGoodF(F);
  
  %Iterazione
    for k=(1:iter)
          H=G1(Sk{k})-Sk{k};
          if(isnan(H))
              return;
            endif
          Sk{k+1}=Sk{k}+ reshape(P*H(:),n,n);
          
          res(k)=norm(Eq(Sk{k+1}))/norm(Sk{k+1});
     endfor
    

    
    figure(1)
      
      semilogy(1:length(res),res,'LineWidth',2);
      axis([1 100 1e-15 1e+3])

      


return
endfunction


