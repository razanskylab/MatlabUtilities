function [] = wait_with_progress(waitDuration,progbarStr)
  if (nargin < 2) || isempty(progbarStr)
    progressbar(0);
  else
    progressbar(progbarStr);
  end
  t1 = tic;
  while (toc(t1)<waitDuration)
    progressbar(toc(t1)./waitDuration);
    pause(0.1); % don't update at inf speed
  end 
  progressbar(1); % close prog. bar
end