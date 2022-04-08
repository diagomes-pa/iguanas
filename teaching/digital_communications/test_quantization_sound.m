function test_quantization_sound()
  
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
  
  b = 5;
  delta = 2/(2^b - 1);
    
  aud_file = "../../data/conquista.wav";
  
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %% Processamento de sinal
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  aud_sig = aud_audioRead(aud_file);
  [aud_q,integer_codeword,levels] = digproc_quantizer(aud_sig,b);
  aud_audioPlay(aud_q, 1);
  
end