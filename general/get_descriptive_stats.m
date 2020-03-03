function [Stats] = get_descriptive_stats(vect,outputStats,descriptor,units)
  if nargin < 2
    outputStats = 0; % no printed output
  elseif nargin < 3
    units = '';
  elseif nargin < 4
    descriptor = '';
    units = '';
  end
  vect(isnan(vect)) = []; 
  Stats.min = min(vect); % Smallest elements in array
  Stats.max = max(vect); % max	Largest elements in array
  Stats.bounds = [Stats.min, Stats.max];% bounds(vect); % bounds	Smallest and largest elements
  Stats.mean = mean(vect);   % mean	Average or mean value of array
  Stats.median = median(vect); % median	Median value of array
  Stats.mode = mode(vect); % mode	Most frequent values in array
  Stats.std = std(vect); % std	Standard deviation
  Stats.stdPer = (std(vect)/mean(vect))*100; % std in percent rel to mean
  Stats.var = var(vect); % var	Variance
  Stats.nEntries = numel(vect); % number of vector elements

  if outputStats
    fprintf('   Mean %s: %2.1f %s\n',descriptor,Stats.mean,units);
    fprintf('    Min %s: %2.1f %s\n',descriptor,Stats.min,units);
    fprintf('    Max %s: %2.1f %s\n',descriptor,Stats.max,units);
    fprintf('    Std %s: %2.1f (%2.1f%%)\n',descriptor,Stats.std,Stats.stdPer);
  end
end
