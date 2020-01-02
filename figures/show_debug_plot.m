function [showPlot] = show_debug_plot()
  % uses global variable showDebugPlots
  % if it's defined somewhere, then use the value stored there
  % to determine if you want to show debug plots troughout your code
  % otherwise use the default defined here
  % use with set_debug_plot(true)
  global showDebugPlots;
  if isempty(showDebugPlots)
    showPlot = 0;
  else
    showPlot = showDebugPlots;
  end
end
