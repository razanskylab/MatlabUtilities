function [] = done(tocHandle)
  if nargin == 0
    fprintf('done.\n');
  else
    fprintf('completed in %3.2fs.\n',tocHandle);
  end
end
