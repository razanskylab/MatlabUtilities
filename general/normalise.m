function y = normalise(x)
  % x = x - mean(x(:));
  y = x./max(abs(x(:)));
end
