function [rawTiffs] = tiff_to_mat(loadPath)
  % NOTE
  % if to slow, here is much faster way:
  % http://www.matlabtips.com/how-to-load-tiff-stacks-fast-really-fast/
  tiffInfo = imfinfo(loadPath);
  nImages = length(tiffInfo);
  for iImage = nImages:-1:1
    tempImage = imread(loadPath,iImage);
    is3D = (ndims(tempImage) == 3);
    is2D = (ndims(tempImage) == 2);
    if is3D % should/must be rgb stack, otherwise we can't use this...
      rawTiffs(:,:,iImage) = rgb2gray(tempImage);
    elseif is2D
      rawTiffs(:,:,iImage) = tempImage;
    else
      error('Can only convert RGB or grayscale TIFFs stacks!');
    end
  end
end
