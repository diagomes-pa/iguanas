function out = src_noise(P, noise_type)
  
  global v;
  
  if(strcmp(noise_type, 'Gaussian'))
    out = sqrt(P)*randn(v.N, 1);    
  endif
  
endfunction