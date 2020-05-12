function [s] = pretty_scatter(x,y,color,faceSize,alpha)
  % [s] = pretty_scatter(x,y,color,faceSize,alpha)
  % s - handle to histogram
  if nargin < 5
    alpha = 0.75;
  end
  if nargin < 4 
    faceSize = 30;
  end
  if nargin < 3 
    color = Colors.DarkGreen;
  end

  s = scatter(x,y,'o');
  s.MarkerEdgeColor = 'none';
  s.MarkerFaceColor = color;
  s.MarkerFaceAlpha = alpha;
  s.SizeData = faceSize;


end
