function [showPlot] = show_debug_plot_w_figure()
  % Same as show debug_plot but also creates a new figure window!
  global showDebugPlots;
  if isempty(showDebugPlots)
    showPlot = 0;
  else
    showPlot = showDebugPlots;
  end
  if showPlot
    figure();
  end
end
