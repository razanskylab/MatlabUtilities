function [matrix] = reverse_normalize(matrix,previousMinMax)
  % previousMinMax = [min max] of matrix before normalization
  matrix = matrix.*diff(previousMinMax); % restore old max values
  matrix = matrix+previousMinMax(1);
end
