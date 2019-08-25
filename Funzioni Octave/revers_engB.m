

function B = revers_engB (S,A)
%B = revers_engB (S,A)

EqB=@(S,A) (S-A)*expm(S)

B=EqB(S,A)

return
endfunction
