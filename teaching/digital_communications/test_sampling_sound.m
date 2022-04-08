function test_sampling_sound()
  
  %% Configura as variáveis fundamentais
  global v;
  v = setFundVars(0.001, 20);
  
  staticSim(@runSim, 2)
 
end

function runSim(curr_val)
  
  global v;
  pkg load signal % Para usar a fun��o decimate
  
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  % Condiguração de Variáveis
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  
  dec_factor = 10;
  aud_file = "../../data/conquista.wav";
  
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %% Processamento de sinal
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  aud_sig = aud_audioRead(aud_file);
  aud_dec = decimate(aud_sig, dec_factor);
  aud_audioPlay(aud_dec, 1/dec_factor);
  
end