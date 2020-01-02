function [imOut] = imagescj(imageData,cMap,x,y)
  % [im] = imagescj(imageData,cMap,x,y)
  % plot image using default or provided colormap
  % show colorbar, use axis iamge and display axis with units if x-y are provided
  % cMap, and x,y are optional
  if nargin < 2 || isempty(cMap)
    cMap = 'gray';
  end

  imageData = squeeze(imageData);

  % switch x and y vectors for plotting, so that for xy = [200x100] with x = 200px and y = 100px
  % is plotted with the larger axis (200 px in this example) is plotted on the
  % abscissa (horizontal axis, x-axis) and the shorter axis (100px in this example)
  % is plotted on the ordinate (vertical axis, y-axis)
  % All this is to avoid confusion, as matrices are intuitivley indexed via
  % matrix(x,y) and not like matlab plots it, which is equvalent to matrix(y,x);
  if nargin > 2
    im = imagesc(x,y,imageData);
  else
    im = imagesc(imageData);
  end

  if nargout > 0
    imOut = im;
  end

  axis image;
  colorbar;
  ax = gca;
  colormap(ax,cMap);

  c = colorbar();
  c.TickLength = 0;
  c.Ticks = [min(c.Ticks) max(c.Ticks)];
end
