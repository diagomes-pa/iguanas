function out = AMMod(v, m, fc, A)
  
  carr = src_sinusoid(1, fc, 0);
  
  out = (A + m).*carr;
endfunction