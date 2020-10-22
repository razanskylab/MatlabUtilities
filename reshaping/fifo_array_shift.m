% fast way to append new data at the end of an array
function fifoArray = fifo_array_shift(fifoArray,newElement)
  fifoArray = circshift(fifoArray,-1); % move all elements over to the left by one
  fifoArray(end) = newElement; % replace last element
  end