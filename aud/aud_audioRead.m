function out = dg_audioRead(audio_file)
  
  global v;
  
  info = audioinfo(audio_file);
  [out, fs_audio] = audioread(audio_file, [1 info.SampleRate*v.T]);
  out = out(:,1);
  
  v.Fs_audio = fs_audio;

endfunction
