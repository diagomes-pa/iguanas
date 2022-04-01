function out = dsbscDemod(r, fc, f_cut)
  
  global v; 
  
  carr = sinusoid(1, fc, 0);  
  r_demod = r.*carr;
  
  [b,a] = lowPassFilter(v, round(0.1*v.N), f_cut);
  
  out = filter(b, a, r_demod);
endfunction