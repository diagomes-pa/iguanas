function out = dsbscMod(m, fc)
  
  global v;
  
  carr = sinusoid(1, fc, 0);
  
  out = m.*carr;
endfunction
