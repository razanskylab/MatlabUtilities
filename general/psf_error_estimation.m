function [xReg, psf, absError, relError,measWidth] = psf_error_estimation(x,psf,vesWidths,doPlot)
  % x - vector at which psf was sampled
  % psf - measure / estimated psf of system
  % vesWidths - vector containing vessel widths to be checked
  % all inputs are assumed to have the same units!

  if nargin < 4
    doPlot = true;
  end

  % resample spread to use for later deconv...
  dX = 0.01; % resample to 0.5 micron grid for good accuracy
  nSamples = 5000;
  halfSamples = round(nSamples./2);

  xReg = -100:dX:100; 
  psf = interp1(x,psf,xReg,'linear',0);

  nVessel = numel(vesWidths);
  measWidth = zeros(1,nVessel);

  for iWidth = 1:nVessel
    vessel = zeros(1,nSamples);
    vesselWidth = vesWidths(iWidth); % make a 10 micron vessel
    sampleHalfWidth = round(vesselWidth./dX./2); % get width based on step size
    vessel(halfSamples-sampleHalfWidth:halfSamples+sampleHalfWidth) = 1; % make vessel
    measVessel = conv(vessel,psf);
    xVes = (1:numel(measVessel)).*dX;
    normMeasVessel = normalize(measVessel);
    measWidth(iWidth) = find_width_at_crossing(xVes,normMeasVessel,0.5);
  end

  absError = measWidth-vesWidths;
  relError = measWidth./vesWidths.*100 - 100;

  if doPlot 
    figure()
    nexttile();
    plot(xReg,psf); 
    title('psf');

    nexttile();
    plot(vesWidths,measWidth); 
    title('real vs. measure width');

    nexttile();
    plot(vesWidths,relError); 
    title('size error (%)');

    nexttile();
    plot(vesWidths,absError); 
    title('size error (abs)');
  end
end