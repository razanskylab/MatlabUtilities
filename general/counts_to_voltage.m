function [signal] = counts_to_voltage(signal,measRange,resolution)
  % converts the signal (should be discrete counts) to a voltage based on
  % the input range and resolution of the used DAQ
  % output signal has same units and measRange
  % signal - signed integer intputs, i.e. +/- counts and where
  % 0 counts are also 0 voltage.
  % meas range - arb. units, out signal will have same units, +/-10 V is a 10 V range!
  % resolution - in bits, not counts! i.e. 8, 12, 14 etc not 2^8, etc

  % see Converting ADC samples to voltage values from Spectrum DAQ Manual

  signal = single(signal);
  lsbSize = measRange/(2.^(resolution-1));
  signal = signal.*lsbSize;

end
