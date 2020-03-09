function [rangeLims] = minmax(matrix)
  minVal = min(matrix(:));
  maxVal = max(matrix(:));
  rangeLims = [minVal maxVal];
end
