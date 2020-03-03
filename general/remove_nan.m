function [vector] = remove_nan(vector)
  % remove nans from vector;
  vector(isnan(vector)) = [];
end
