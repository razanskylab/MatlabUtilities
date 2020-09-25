% improved version oj imagescj
% renamed to not destroy functions using imagscj which might be a few by now
% takes 2d image data and displays it with proper axis, not flipped etc
% see imagesc_pitfalls.m for explanation whats going on...
% examples
% imData = rand(30,40);
% x = 1:30;
% y = 1:40;
% imj(imData) - display imData
% imj(x,y,imData) - display imData

function [varargout] = imj(varargin)
  defaultColorMap = gray(2^8);
  defaultShowColorBar = true;
  defaultAxisMode = 'image'; % {'image' or 'normal'}

  cMap = defaultColorMap;
  showCBar = defaultShowColorBar;
  axisMode = defaultAxisMode;

  p = inputParser;
  addParameter(p,'ColorMap',defaultColorMap,@(x)isnumeric(x)||ischar(x));
  addParameter(p,'ShowColorBar',defaultShowColorBar,@islogical);
  addParameter(p,'AxisMode',defaultAxisMode,@ischar);

  % parse possible inputs %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  if nargin == 1 % simplest case, just im data
    imData = varargin{1};
    imData = squeeze(imData); % just for good measure...
    % make sure its numeric matrix
    if ~isvector(imData) && ~ismatrix(imData)
      error('imj requires 2D input!');
    end
    % use idx as labels
    x = 1:size(imData,1);
    y = 1:size(imData,2);
  elseif nargin == 3 && isvector(varargin{1}) && isvector(varargin{2})
    % x and y axis provided as well...
    x = varargin{1};
    y = varargin{2};
    imData = varargin{3};
    if length(x) ~= size(imData,1)
      error('Length of x-vector does not match first dimension in image data!');
    end
    if length(y) ~= size(imData,2)
      error('Length of y-vector does not match first dimension in image data!');
    end
  elseif nargin > 3 && isvector(varargin{1}) && isvector(varargin{2}) && ismatrix(varargin{3})
    x = varargin{1};
    y = varargin{2};
    imData = varargin{3};
    parse(p,varargin{4:end});
    cMap = p.Results.ColorMap;
    showCBar = p.Results.ShowColorBar;
  elseif nargin > 1
    % xy data and maybe cmap or colorbar info provided
    imData = varargin{1};
    imData = squeeze(imData); % just for good measure...
    % use idx as labels
    x = 1:size(imData,1);
    y = 1:size(imData,2);
    parse(p,varargin{2:end});
    cMap = p.Results.ColorMap;
    showCBar = p.Results.ShowColorBar;
  end

  % all inputs parsed, do plotting %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  imData = squeeze(imData);
  imData = imData'; % flip here and only here for plotting!
  imOut = imagesc(x,y,imData);
  if strcmp(axisMode,'image')
    axis image; % equally spaces axis
  else
    axis normal;
  end
  axis xy; % coord system starts at bottom left

  ax = gca;
  colormap(ax,cMap);

  if showCBar
    colorbar;
  end

  % remove visible ticks on image
  ax.TickLength = [0 0];

  c = colorbar();
  c.TickLength = 0; % remove colorbar ticks, they are anoying
  % c.Ticks = [min(c.Ticks) max(c.Ticks)]; % only show lowest and highest tick?

  if nargout == 1
    varargout{1} = imOut;
  end

  % fixme remove x-y axis ticks as well for images
end
