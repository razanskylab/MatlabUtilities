% check that trigger/hardware mode is supported, return unified name
% i.e. edge instead of oa, dye instead of Dye,...

function [mode] = validate_mode(inMode)
  if isnumeric(inMode) % convert fastscan scan type to mode
    % use of number based mode indentifiers is discouraged!
    switch inMode
    case 0
      mode = 'us';
    case 1
      mode = 'edge';
    case 2
      mode = 'dye';
    case 4
      mode = 'onda';
    % case 3 % not used yet
      % mode = 'dual';
    otherwise
      error('Unknown mode!');
    end
  elseif ischar(inMode)
    inMode = lower(inMode);
    switch inMode
    case {'edge','oa','532','green'} % some are legacy names!
      mode = 'edge';
    case {'dye','orange'} % some are legacy names!
      mode = 'dye';
    case {'onda32','onda','onda532'} % some are legacy names!
      mode = 'onda32';
    case {'onda64','onda1064','ir'} % some are legacy names!
      mode = 'onda64';
    case {'us'} % some are legacy names!
      mode = 'us';
    otherwise
      error('Unknown mode!');
    end
  end

end
