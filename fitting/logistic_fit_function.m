function FitResult = logistic_fit_function(xData,yData,doPlot,isRisingEdge)
  % FitResult = logistic_fit_function(xData,yData,doPlot)
  % FitResult = logistic_fit_function(xData,yData,doPlot,isRisingEdge)
  if nargin < 4
    isRisingEdge = false; % default is rising edge
  end

  xData = double(xData(:));
  yData = double(yData(:));
  % prepare fit model
  % fitModel = 'a1*exp(-((x-b1)^2/(2*c1^2))) + d1';

  % Logistic Fit
  if isRisingEdge
    fitModel = 'a/(1+exp(b*(c-x)))'; % a = amplitude, b = spread, c = x0
  else % falling edge...
    fitModel = '1-a/(1+exp(b*(c-x)))'; % a = amplitude, b = spread, c = x0
  end

  % y(x) = a./(1+exp(b.*(c-x)));

  fitType = fittype(fitModel,'coefficients',{'a','b','c'});
  fitOptions = fitoptions(fitType);

  [~, maxDiffIdx] = max(abs(gradient(yData)));
  xCenter = xData(maxDiffIdx);

  % provide fit options ---------------------------------------------------------
  % [amplitude, spread, x0]
  fitOptions.StartPoint =  [1 0.5 xCenter];
  fitOptions.Lower =  [0 0 0];
  fitOptions.Upper =  [2 Inf max(xData)];
  % fitOptions.TolX = 1e-16;
  % fitOptions.TolFun = 1e-16;
  % fitOptions.MaxIter = 2000;
  % fitOptions.Robust = 'Bisquare';

  % perform actual fit ---------------------------------------------------------
  [FitResult,~] = fit(xData,yData,fitType,fitOptions);
%
%   if (fitQuality.adjrsquare < 0.5) && (fitQuality.adjrsquare >= 0.1)
%     short_warn('Poor fit!')
%   elseif fitQuality.adjrsquare < 0.1
%     short_warn('Trying fit again with oposite edge.')
%     FitResult = logistic_fit_function(xData,yData,doPlot,~isRisingEdge);
%   end

  if doPlot
    % Fit model to data.
    figure();
    hold on
    plot(FitResult,xData,yData,'predfunc')
    legend('Measured Data','Gauss Fit','Confidence Bounds')
  end

end
