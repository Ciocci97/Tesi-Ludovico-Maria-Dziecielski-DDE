
function  [S,A,B]= testGallery (c,S,A,B)
  %[S,A,B]= testGallery (c,S,A,B)
  %0--  [S,A]=BtestGallery(0,A,B,S) per aggiungere un caso, output il caso corrispondente 
%1--  matrici 4x4 con bassa norma ed S nel branch 0
%2--  matrici 4x4 con alta norma ed S nel branch 0
%3--  matrici 2x2 caso del paper di Cepeda-Gomez

  load testFile.mat numtest;
  n=numtest;
  
  if(c==0)  
    n=n+1;
    numtest=n;
    nameA = genvarname (["A" mat2str(n)]);
      eval ([nameA " = A"]);
      
    nameB = genvarname (["B" mat2str(n)]);
      eval ([nameB " = B"]);
     
    nameS = genvarname (["S" mat2str(n)]);
      eval ([nameS " = S"]);
    
    save("-append","testFile.mat",nameA,nameB,nameS,"numtest");
    
    S=n;
    A=n;
    B=n;
  else
      
      if(c<=n)
        nameA = genvarname (["A" mat2str(c)]);
         
        nameB = genvarname (["B" mat2str(c)]);
         
        nameS = genvarname (["S" mat2str(c)]);
          
    
        A=load("testFile.mat",nameA);
        B=load("testFile.mat",nameB);
        S=load("testFile.mat",nameS);
        
        A=getfield(A,nameA);
        B=getfield(B,nameB);
        S=getfield(S,nameS);
        
      else
        A=-1;
        B=-1;
        C=-1;
      endif
    endif
endfunction
