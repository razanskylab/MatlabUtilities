function [timeStr] = tic_to_min_str(ticHandle)
  if nargin < 1
    durStr = duration(seconds(toc),'Format','mm:ss');
  else
    durStr = duration(seconds(toc(ticHandle)),'Format','mm:ss');
  end
  timeStr = sprintf('%s min',durStr);
end