function [overlayed,montage] = im_overlay(background,overlay,varargin)
  % alpha blends the overlay (used as opcity map) with the background image
  % using the optional input argument color for the overlay
  % returns overlayed image (as rgb image, that's the tricky part...)
  % as well as a composite image (called montage)

  % set default values for optional input parameters
  C = Colors();
  defaultOpacity = 1;
  defaultShowMontage = false;
  defaultColor = C.PureRed;

  % check input parameters
  p = inputParser;
  addRequired(p,'background',@isnumeric);
  addRequired(p,'overlay',@isnumeric);
  addParameter(p,'color',defaultColor,@isnumeric);
  addParameter(p,'opacity',defaultOpacity,@iscell);
  addParameter(p,'showMontage',defaultShowMontage,@islogical);
  parse(p,background,overlay,varargin{:});

  % set the optional input paremeters
  color = p.Results.color;
  opacity = p.Results.opacity;
  showMontage = p.Results.showMontage;

  % overlay = single(M.filtScales(:,:,1));
  if sum(any(overlay < 0 | overlay > 1))
    error('Overlay must be >0 and <1!');
  end
  % overlay = single(M.filtScales(:,:,1));
  if any(size(color) ~= size(C.PureRed))
    error('Color must be of size 1 x 3!');
  end

  cMap = gray(2^8-1); % 8bit good enough for displaying...
  nColors = size(cMap,1);
  Gs = round(interp1(linspace(min(background(:)),max(background(:)),nColors),1:nColors,background));
  background = reshape(cMap(Gs,:),[size(Gs) 3]); % Make RGB image from scaled.
  white = cat(3, ones(size(overlay)),ones(size(overlay)), ones(size(overlay))).*opacity;
  colorOverlay = zeros(size(white));
  for iCol = 1:3
    colorOverlay(:,:,iCol) = white(:,:,iCol)*color(iCol);
  end

  halphablend = vision.AlphaBlender;
  halphablend.Opacity = overlay;
  overlayed = step(halphablend,background,colorOverlay);

  % montage = imfuse(overlay,overlayed,'montage');
  % the following lines do the exact same as imfuse above
  % but with a lot less overhead (2xfaster)
  overlay = normalize(overlay);
  overlay = repmat(im2uint8(overlay),[1 1 3]);
  overlay = im2uint8(overlay);
  overlayed = im2uint8(overlayed);
  montage = [overlay overlayed];
  if showMontage
    figure();
    imshow(montage);
  end
end
