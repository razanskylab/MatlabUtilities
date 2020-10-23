function [nearestVal,nearestIdx,distance] = find_nearest(findVals,data)
  findVals = single(findVals(:));
  data = single(data(:));
  [nearestIdx,distance] = dsearchn(data,findVals);
  nearestVal = data(nearestIdx);
end
