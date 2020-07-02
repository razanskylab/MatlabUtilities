function FitResult = gauss_beam_fit(xData,yData,doPlot)

  xData = double(xData(:));
  yData = double(yData(:));
  % prepare fit model
  % fitModel = 'a1*exp(-((x-b1)^2/(2*c1^2))) + d1';

  fitModel = 'a*sqrt(1+((x-b)/c)^2)';
  % a = w0, b = zeroPoint = spread, c = rayleigh length

  fitType = fittype(fitModel,'coefficients',{'a','b','c'});
  fitOptions = fitoptions(fitType);

  [minSize,minIdx] = min(yData);
  minPos = xData(minIdx);

  % provide fit options ---------------------------------------------------------
  % [amplitude, spread, x0]
  fitOptions.StartPoint =  [minSize minPos minSize];
  fitOptions.Lower =  [0 0 0];
  fitOptions.Upper =  [Inf Inf Inf];
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
    % figure();
    hold on
    plot(FitResult,xData,yData,'predfunc')
    legend('Measured Data','Gauss Fit','Confidence Bounds')
  end

end
