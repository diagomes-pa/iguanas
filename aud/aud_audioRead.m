function out = aud_audioRead(audio_file)
  
  global v;
  
  info = audioinfo(audio_file);
  [out, Fs_audio] = audioread(audio_file, [1 info.SampleRate*v.T]);
  out = out(:,1);
  
  v.Fs_audio = Fs_audio;

endfunction
