% ReMapProperties class, nicer way to define multiple properties compared to structs...
% as it allows validation etc.

classdef OutputProperties < handle
  properties
    folder(1,:) char;
    nameSuffix;

    interpFactor(1,1) double {mustBeNumeric, mustBeFinite} = 1; % >1 interpolation, <1 reduction
  end

end
