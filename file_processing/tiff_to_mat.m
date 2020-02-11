function [rawTiffs] = tiff_to_mat(loadPath)
  % NOTE
  % if to slow, here is much faster way:
  % http://www.matlabtips.com/how-to-load-tiff-stacks-fast-really-fast/
  tiffInfo = imfinfo(loadPath);
  nImages = length(tiffInfo);
  for iImage = nImages:-1:1
    rawTiffs(:,:,iImage) = imread(loadPath,iImage);
  end
end
