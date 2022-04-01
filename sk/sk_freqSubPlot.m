function sk_freqSubPlot(sig, tit, Max_freq, F_nyquist)
  
  # F_nyquist: se 1, mostra o valor da frequência de Nyquist. Se 0, mostra Fs/2.
  
  global v;
  global fi;
  
  %Max_freq = v.Fs/2;
  %freq = linspace(-Max_freq, Max_freq, v.N);
  
  n_sig = size(sig, 2);  
    
  for p = 1 : n_sig
    subplot(min(n_sig, 3), ceil(n_sig/3), p);
    
    freq = linspace(-Max_freq{p}, Max_freq{p}, length(sig{p}));
    tmp_spec = 20*log10(abs(fftshift(sig{p} + 1e-15)));
    plot(freq, tmp_spec, "LineWidth", 1);
    
    if(F_nyquist)
      xticks([-Max_freq{p}, Max_freq{p}]);
    else
      xticks([-Max_freq Max_freq]);
      xticklabels({"-Fs/2", "Fs/2"})
    endif
    
    xlabel("Frequência")
    title(tit{p});
    
  endfor
    
  h=get(gcf, "currentaxes");
  set(h, "fontsize", 18); 
  grid  
  
end