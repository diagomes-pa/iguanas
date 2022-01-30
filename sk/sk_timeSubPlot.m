function sk_timeSubPlot(sig, tit, time_gran)
  
  # time_gran: representa a granularidade do tempo, se é contínuo ou discreto. 
  # recebe um vetor que strings, c ou d, para sinais de tempo contínuo ou discreto,
  # respectivamente. Exemplo: para dois sinais, em que o o primeiro é contínuo e o
  # segundo discreto, deve-se fornecer o vetor ["c", "d"].
  
  global v;
  global fi;
    
  n_sig = size(sig, 2);  
    
  for p = 1 : n_sig
    subplot(min(n_sig, 3), ceil(n_sig/3), p);
    
    if(time_gran(p) == 'c')
      plot(sig{p}, "LineWidth", 1);
    elseif(time_gran(p) == 'd')
      stem(sig{p}, "LineWidth", 1);
    endif
    
    y_range = max(sig{p}) - min(sig{p});     
    axis([1 length(sig{p}) (min(sig{p})-0.1*y_range) (max(sig{p})+0.1*y_range)])    
    xlabel("Tempo")
    title(tit{p})
  
  endfor
    
  h=get(gcf, "currentaxes");
  set(h, "fontsize", 14); 
  grid  
  
end