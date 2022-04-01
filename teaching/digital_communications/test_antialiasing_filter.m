function test_antialiasing_filter()
  
  %% Configura as variáveis fundamentais
  global v;
  v = setFundVars(0.001, 1);
  
  staticSim(@runSim, 2)
 
end

function runSim(curr_val)
  
  global v;
  pkg load signal % Para usar a fun��o decimate
  
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  % Condiguração de Variáveis
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  
  dec_factor = 2;  
  f1 = 50;
  f2 = 300;
  
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %% Processamento de sinal
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  s = src_sinusoid(1, f1, 0) + src_sinusoid(1, f2, 0);
  s_dec = decimate(s, dec_factor);
  s_down = downsample(s, dec_factor);
  
  S = abs(fft(s));  
  S_DEC = fft(s_dec);
  S_DOWN = fft(s_down);
  
  sk_freqSubPlot({S, S_DEC, S_DOWN}, {"S", "S_DEC", "S_DOWN"}, {500, 250, 250}, 1);
    
end