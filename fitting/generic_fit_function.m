function FitResult = generic_fit_function(xData,yData,doPlot)

  xData = xData(:);
  yData = yData(:);
  % prepare fit model
  % fitModel = 'a1*exp(-((x-b1)^2/(2*c1^2))) + d1';

  % Logistic Fit
  fitModel = 'a/(1+exp(b*(c-x)))'; % a = amplitude, b = spread, c = x0

  fitType = fittype(fitModel,'coefficients',{'a','b','c'});
  fitOptions = fitoptions(fitType);

  [~, maxDiffIdx] = max(gradient(yData));
  xCenter = xData(maxDiffIdx);

  % provide fit options ---------------------------------------------------------
  fitOptions.StartPoint =  [1 0.5 xCenter];
  fitOptions.Lower =  [0 0 0];
  fitOptions.Upper =  [2 Inf Inf];
  % fitOptions.TolX = 1e-16;
  % fitOptions.TolFun = 1e-16;
  % fitOptions.MaxIter = 2000;
  % fitOptions.Robust = 'Bisquare';

  % perform actual fit ---------------------------------------------------------
  [FitResult,~] = fit(xData,yData,fitType,fitOptions);

  if doPlot
    % Fit model to data.
    figure();
    hold on
    plot(FitResult,xData,yData,'predfunc')
    legend('Measured Data','Gauss Fit','Confidence Bounds')
  end

end
