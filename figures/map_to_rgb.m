function [rgbImage] = map_to_rgb(map, colormap)
  map = uint8(normalize(map) .* 255);
  rgbImage = ind2rgb(map, colormap);
end
