function plot_crosshair(center,color,imageSize)
  nCircles = 5; 

  ax = gca;
  oldXLim = ax.XLim;
  oldYLim = ax.YLim;
  if nargin < 3
    imageSize = [range(oldXLim) range(oldYLim)];
  end
  if nargin < 2
    color = Colors.DarkOrange;
  end

  % absolute max length line could have
  maxLength = ceil(sqrt(imageSize(1).^2 + imageSize(2).^2)); 
  xStart = center(1);
  yStart = center(2);

  hold on;
  for iAng = 0:45:360
    xEnd = xStart + (maxLength.*cos(deg2rad(iAng)));
    yEnd = yStart + (maxLength.*sin(deg2rad(iAng)));
    plot([xStart xEnd],[yStart yEnd],'LineStyle','--','LineWidth',2, 'Color', color);
  end
  centers = repmat([xStart yStart],nCircles,1);
  radii = linspace(maxLength./nCircles./2,round(maxLength./2),nCircles);
  viscircles(centers,radii,'LineStyle','--','LineWidth',2, ...
    'Color', color, 'EnhanceVisibility', 0);

  % restore original axis limits
  hold off;
  ax.YLim = oldYLim;
  ax.XLim = oldXLim;
end