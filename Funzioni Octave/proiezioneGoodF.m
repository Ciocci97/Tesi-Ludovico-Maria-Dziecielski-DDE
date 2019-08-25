
function gP = proiezioneGoodF (F)
  %gP = proiezioneGoodF (F) proiezione negli autovalori convergenti
  
  [U,V]=eig(F);
  aeF= abs(diag(V));
  pos=[];
  
  for ii=(1:length(aeF))
    if(aeF(ii)<1)
      pos=[pos ii];
    endif  
  end
  
  if(length(pos)!=0)
    disp("il metodo proietta su") 
    disp(pos)
    UU=U(:,pos);
    
    [Q,R]=qr(UU);
    
    QQ=Q(:,length(pos));
    
    gP=QQ*QQ';
  
  else  
    gP=I;
  end
endfunction
