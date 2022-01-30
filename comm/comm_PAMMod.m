function out = comm_PAMMod(Tx_bits, b)
  # Tx_bits: os bits que serão transmitidos.
  # b: número de bits por símbolo.
  
  global v;
  
  n_symb = floor(v.T/v.Tsymb); # Número de símbolos na simulação.
  n_samp_symb = floor(v.Tsymb/v.Ts); # Número de amostras por símbolo.
  
  out = zeros(v.N, 1);
  symbs = zeros(n_symb, 1); # Símbolos da constelação.
  
  constel = comm_PAMConstel(b);
  Tx_bits = reshape(Tx_bits, n_symb, b);
  
  for s = 1 : n_symb
    
    symb_ind = bin2dec(num2str(Tx_bits(s,:))) + 1;
    symbs(s) = constel(symb_ind);
  endfor
  
  symbs_oversampled = zeros(v.N, 1);
  symbs_oversampled(1:n_samp_symb:end) = symbs;
  
  base_signal = ones(n_samp_symb, 1);
  
  out = filter(base_signal, 1, symbs_oversampled);
  
endfunction
