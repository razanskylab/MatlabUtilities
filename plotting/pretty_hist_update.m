function [h,s,p,edges] = pretty_hist_update(x,h,s,p,normalization)
  % [h,s,p] = pretty_hist(x,color,nBins,normalization,doFit)
  % [h,s,p] = pretty_hist(x,[1 0 0],100,'probability',false);
  % h - handle to histogram
  % s - handle to stairs
  % p - handle to fit plot
  nBins = numel(h.BinCounts);
  [counts,edges] = histcounts(x,nBins,'Normalization',normalization);
  % make y axis nicer for Probability plots...
  if strcmp(normalization,'probability')
    counts = counts*100; % show prob. in %
  end

  h.BinCounts = counts; 
  h.BinEdges = edges;
  
  fullEdges = edges;
  edges = edges(1:end-1);
  s.XData = edges;
  s.YData = counts;

  % ger kernel estimate for nBins points 
  if ~isempty(p)
    xEval = linspace(fullEdges(1),fullEdges(end),nBins*5);
    [est,pointLoc] = ksdensity(x,xEval,'BoundaryCorrection','reflection'); 
    est = est./max(est(:)).*max(counts(:)); % scale to match counts
    % p = plot(pointLoc,est);
    p.XData = pointLoc;
    p.YData = est;
  else
    p = []; 
  end

end
