% split_2D_to_3D_matrix
%
% kinda hard to explain, but I'll try...
% take a 2D matrix of size nSamples x nShots
% and turns it into a 3D matrix of size comSize x splitNCols x nSamples
% the whole point is to to form a 3D matrix which we can then
% get the max of very very fast
% see how its down in the ShotData.Plot function...
% Johannes Rebling, (johannesrebling@gmail.com), 2018

function [splitMatrix] = split_2D_to_3D_matrix(twoDimMatrix, splitNCols)
  [~,nCols] = size(twoDimMatrix);
  combinedCols = floor(nCols./splitNCols);
  splitMatrix = twoDimMatrix(:,1:combinedCols*splitNCols)'; % make sure reshape is possible
  splitMatrix = reshape(splitMatrix,combinedCols,splitNCols,[]);
end
