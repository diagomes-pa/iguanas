function [b, a] = ch_identity(v)
  
  b = zeros(v.N, 1);
  b(1) = 1;
  
  a = 1;
  
endfunction
