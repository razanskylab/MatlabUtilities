function [matrix] = normalize(matrix)
  matrix = matrix - min(matrix(:));
  matrix = matrix./max(matrix(:));
end
