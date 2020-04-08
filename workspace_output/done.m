function [] = done(tocHandle,showOutput)
  % showOutput - optional, usefull in combination with verbose flag...
  if nargin < 2
    showOutput = 1; 
  end
  if showOutput
    if nargin == 0
      fprintf('done.\n');
    else
      fprintf('completed in %3.2fs.\n',tocHandle);
    end
  end
end

