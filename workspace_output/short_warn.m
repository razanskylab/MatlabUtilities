function short_warn(warningMessage)
  % short_warn(warningMessage)
  % warningMessage - string containing the warning message
  % display a less annoying warning message with out the exact location in code
  % usefull to warn the user of a less critical event that he should be aware of
  % but that does not require him to actually make changes to the code

  warning('off','verbose')
  warning('off','backtrace') %% this is the annoying part!
  % give actual warning
  warning(warningMessage)
  % switch to default warning message behavoir
  warning('off','verbose')
  warning('on','backtrace')
end
