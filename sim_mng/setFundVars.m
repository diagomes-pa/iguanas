function v = setFundVars(Ts_, T_)
  # Configures the fundamental variables.

   v.Ts = Ts_;
   v.Fs = 1/Ts_;
   v.T = T_;
   t_tmp = 0 : Ts_ : T_ - Ts_;
   v.t = transpose(t_tmp);
   v.N = length(v.t);
  
endfunction
