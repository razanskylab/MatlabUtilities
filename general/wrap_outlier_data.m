function [data, lowLim, upLim] = wrap_outlier_data(data,percentiles)
  % [data] = wrap_outlier_data(data,[lowLim upLim]);
  % lowLim & upLim expressed as percentiles
  % i.e. percent of min max values to wrap
  
  lowLim = prctile(data(:),percentiles(1)); 
  upLim = prctile(data(:),percentiles(2)); 
  data(data(:)>upLim) = upLim;
  data(data(:)<lowLim) = lowLim;
end