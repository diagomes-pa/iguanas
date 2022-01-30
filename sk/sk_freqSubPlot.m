function sk_freqSubPlot(sig, tit)
  
  # time_gran: representa a granularidade do tempo, se é contínuo ou discreto. 
  # recebe um vetor que strings, c ou d, para sinais de tempo contínuo ou discreto,
  # respectivamente. Exemplo: para dois sinais, em que o o primeiro é contínuo e o
  # segundo discreto, deve-se fornecer o vetor ["c", "d"].
  
  global v;
  global fi;
  
  Max_freq = v.Fs/2;
  freq = linspace(-Max_freq, Max_freq, v.N);
  
  n_sig = size(sig, 2);  
    
  for p = 1 : n_sig
    subplot(min(n_sig, 3), ceil(n_sig/3), p);
    
    tmp_spec = 20*log10(abs(fftshift(sig{p} + 1e-15)));
    plot(freq, tmp_spec, "LineWidth", 1);
    
    xticks([-Max_freq Max_freq]);
    xlabel("Frequ�ncia")
    title(tit{p});
  
  endfor
    
  h=get(gcf, "currentaxes");
  set(h, "fontsize", 14); 
  grid  
  
end