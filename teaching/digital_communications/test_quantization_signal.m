function test_quantization_signal()
  
  %% Configura as variáveis fundamentais
  global v;
  v = setFundVars(0.001, 10);
  
  staticSim(@runSim, 2)
 
end

function runSim(curr_val)
  
  global v;
  pkg load signal % Para usar a fun��o decimate
  
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  % Condiguração de Variáveis
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   
  P = 1;
  f_cut = 300;
  b = 14;
  
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %% Processamento de sinal
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  %s = src_filtNoise(P, f_cut);
  s = src_sinusoid(1, 10, 0);
  [s_q,integer_codeword,levels] = digproc_quantizer(s,b);
  e = s - s_q;
  
  sk_timePlot([s, s_q, e], {"s", "s_q", "e"}, ["d", "d", "d"]);
  
  P_e = mean(e.^2)
  P_e_est = 1/(3*(2^b)^2)
  
end