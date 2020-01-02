function [sigMat] = apply_signal_polarity(sigMat,signalPolarity)
  switch signalPolarity
    case 0
    case 1
      sigMat(sigMat<0) = 0; % take pos only values
    case 2
      sigMat = abs(hilbert(sigMat));
    case 3
      sigMat(sigMat>0) = 0; % take neg only values
      sigMat = -sigMat; % make all positive for plotting
    case 4
      sigMat = abs(sigMat); % take absolute values
  end
end
