function [FR,GOF] = gauss_fit(xData,yData,doPlot)

  xData = double(xData(:));
  yData = double(yData(:));
  % prepare fit model
  fitModel = 'a*exp(-((x-b)^2/(2*c^2))) + d';

  fitType = fittype(fitModel,'coefficients',{'a','b','c','d'});
  fitOptions = fitoptions(fitType);

  [amp, maxIdx] = max(yData);
  xCenter = xData(maxIdx);


  % provide fit options ---------------------------------------------------------
  fitOptions.StartPoint =  [amp xCenter 0.1 0];
  fitOptions.Lower =  [0   0   0   -Inf];
  fitOptions.Upper =  [Inf Inf Inf Inf];
  % fitOptions.TolX = 1e-16;
  % fitOptions.TolFun = 1e-16;
  % fitOptions.MaxIter = 2000;
  % fitOptions.Robust = 'Bisquare';

  % perform actual fit ---------------------------------------------------------
  [FR,GOF] = fit(xData,yData,fitType,fitOptions);
  % Fit model to data.
  if doPlot == 1 % normal plotting
    yFit = FR.a.*exp(-((xData-FR.b).^2/(2*FR.c.^2))) + FR.d;
    figure();
    hold on
    plot(FR,xData,yData,'predfunc');
    legend('Measured Data','Gauss Fit','Confidence Bounds')
  elseif doPlot == 2 % quick plotting
      yFit = FR.a.*exp(-((xData-FR.b).^2/(2*FR.c.^2))) + FR.d;
      plot(xData,yFit);
  end

end
