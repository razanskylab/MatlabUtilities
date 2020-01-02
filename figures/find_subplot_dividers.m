function [m,n] = find_subplot_dividers(nPlots)
  % functions provides best way to split up a subplot with n plots
  % nPlots - number of required subplots
  % returns m and n, to be used as subplot(m,n,i)

  floored = floor(sqrt(nPlots));
  ceiled = ceil(sqrt(nPlots));
  if (ceiled*floored) >= nPlots
    m = ceiled;
    n = floored;
  else
    m = ceiled;
    n = ceiled;
  end
  if m > n
    temp = m;
    m = n;
    n = temp;
  end
end
