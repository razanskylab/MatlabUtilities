function [filtImage, filtDepth] = remove_spot_noise(rawIm, treshLevels, rawDepth)
  % treshLevels [10] - higher values produce more agressive spot removal
  filtImage = rawIm;
  rawIm = normalize(rawIm);

  if nargin < 2
    treshLevels = 10;
  end

  % treshLevels, to be a scalar with value <= 20.
  if treshLevels < 2
    treshLevels = 2;
  end

  if treshLevels > 20
    treshLevels = 20;
  end

  % normalize (will be reverse afterwards)....
  % preMinMax = minmax(rawIm);

  %% remove spot-like image noise, we get that a lot with skin
  % get vert & hor. standard deviation for each pixel neighborhood
  stdHor = colfilt(rawIm, [1 3], 'sliding', @std);
  stdVer = colfilt(rawIm, [3 1], 'sliding', @std);
  % combine these two
  maxStd = stdHor .* stdVer;
  maxStd = normalize(maxStd);

  % use multithresh to get levels for binarization, can give warnings but we
  % can ignore those
  [~, msgId] = lastwarn;
  warnStruct = warning('off', msgId);
  levels = multithresh(maxStd, treshLevels);
  warning(warnStruct);
  noise = imbinarize(maxStd, levels(1));

  % replace noise pixels with median value of sorrounding pixels
  filtImage(noise) = NaN;
  filtImage = fillmissing(filtImage, 'linear');

  if (nargin == 3)% depth info also needs to be filtered
    filtDepth = rawDepth;
    filtDepth(noise) = NaN;
    filtDepth = fillmissing(filtDepth, 'nearest'); % DO NOT USE Linear here!
  end

  % [filtImage] = reverse_normalize(filtImage, preMinMax);

end
