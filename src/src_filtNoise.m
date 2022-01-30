function out = src_filtNoise(P, f_cut)
  
  global v;
  
  n = sqrt(P)*randn(v.N, 1);    
   
  [b, a] = lowPassFilter(0.1*v.N, f_cut);
  
  out = filter(b, a, n);
  
endfunction