
function k = zToBranch (z)
  %function k = zToBranch (z)
  %funzione che va da z al branch a cui z appartiene
  
  imz=imag(z)
  fBr=@(z) -z*cot(z)+z*i;
  flagCon=0;
  if(imz<0)
      imz=-imz;
      flagCon=1
   endif
   
   kpi=ceil(imz/pi);
   
   if(mod(kpi,2)==0&&kpi!=0)
      k=(kpi)/2;
      if(flagCon)
        k=-k
      endif
      return
   endif
   
   rcot= -imz*cot(imz);
   
   if(real(z)>rcot)
    k=(kpi-1)/2;
      if(flagCon)
        k=-k
      endif
   else
    k=(kpi-1)/2 +1; 
       if(flagCon)
        k=-k
      endif
   endif
   
endfunction
