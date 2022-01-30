# Simulação dinâmica em que é possível mudar o valor das variáveis, em tempo
# de execução.

function animSim_dsbsc()
  
  %% Configura as variáveis fundamentais
  global v;
  v = setFundVars(0.001, 10);
  
  animSim(@runSim, 2, [1, 100])
 
end

function runSim(curr_val)
  
  global v;
  
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  % Condiguração de Variáveis
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  
  fc = curr_val;
  f_cut = fc;

  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %% Transmissor
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  m = sinusoid(v, 1, 2, 0);
  global s;
  s = dsbscMod(m, fc);

  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %% Canal
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  noise = src_noise(v, 0.01, 'Gaussian');
  [b, a] = ch_identity(v);
  r = filter(b, a, s) + noise;

  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %% Receptor
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  m_hat = dsbscDemod(r, fc, f_cut);

  sk_animTimePlot(1, [m, s, m_hat], 'test', {'m', 's', 'mhat'});  
  
end