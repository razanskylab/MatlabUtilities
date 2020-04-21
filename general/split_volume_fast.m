function [botVolKeep] = split_volume_fast(nX,nY,nZ,splitPlane)
  linZIdx = uint16(repmat(1:nZ,[nY,1])); % array from 1:nZ with nY rows
  botVolKeep = false([nY,nZ,nX]);
  for iX = 1:nX
    splitLine = splitPlane(iX,:)';
    % t = linZIdx > splitLine;
    botVolKeep(:,:,iX) = linZIdx > splitLine;
  end
  botVolKeep = permute(botVolKeep,[3 1 2]);
end
