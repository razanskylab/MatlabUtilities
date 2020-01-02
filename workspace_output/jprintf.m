function [printTic] = jprintf(strIn)
  % prints a simple string and tics, to be used with done(toc)...
  if nargout
    printTic = tic;
  else
    tic;
  end
  fprintf(strIn);
end
