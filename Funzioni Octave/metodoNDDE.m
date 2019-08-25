
function Sk = metodoNDDE (branch,A,B,S0)
%Sk = metodoNDDE (branch,A,B,S0,iter), metodo di newton 

 iter=200;

n=length(A(1,:)); 
I=eye(n);
p=4;
figure(7)
%clf
 
n=length(A(1,:)); 

  N1=@(S) (S-A)*expm(S)-B;
   
  
  %se presente il parametro S0 parta da quello altrimenti chiama la funzione per ottenere S0 
  flagPar=false;
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
  
  F=@(S) (S-A)*expm(S)-B;
  %Iterazione
    for k=(1:iter)

          Dk=frechet_d(0,Sk{k},A,B);
            if(isnan(Dk))
              Sk{200}=zeros(n);
              return;
            endif
          H=reshape(Dk\(-F(Sk{k}))(:),n,n);
        
          Sk{k+1}=Sk{k}+H;
          
          res(k)=norm(F(Sk{k+1}))/norm(Sk{k+1});
          
     endfor
    

    
    figure(1)
      
      semilogy(1:length(res),res,'LineWidth',2);
      axis([1 iter 1e-15 1e+3])

      


return
endfunction


