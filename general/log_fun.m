function [y] = log_fun(x, amp, spread, offset, isRising)
    if nargin < 5
      isRising = 1;
    end

    if isRising
      y = amp./(1+exp(spread.*(offset-x)));
    else
      y = 1 - amp./(1+exp(spread.*(offset-x)));
    end
end