function print_info_stamp_in_figure()
  % print_info_stamp_in_figure() displays a little info text at the bottom of
  % the current figure, explaining which script created this figure and when

  [ST] = dbstack('-completenames', 1);
  if isempty(ST)
    firstLine = ['Created by J.R. on ' datestr(datetime('now'),'yy_mm_dd')];
    secondLine = 'called from command line';
    stampText = sprintf('%s %s',firstLine,secondLine);
  else
    callerName = ST.name;
    firstLine = ['Created by J.R. on ' datestr(datetime('now'),'yy_mm_dd')];
    secondLine = ['using "' callerName];
    stampText = sprintf('%s %s.m"',firstLine,secondLine);
  end


  FigH = gcf;
  axes('Parent', FigH, ...
  'Units', 'normalized', ...
  'Position', [0, 0, 1, 1], ...
  'Visible', 'off', ...
  'XLim', [0, 1], ...
  'YLim', [0, 1], ...
  'NextPlot', 'add');

  text(0.5,0.01, stampText, ...
  'HorizontalAlignment', 'center', ...
  'VerticalAlignment', 'bottom',...
  'Interpreter','none');

end
