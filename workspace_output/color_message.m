function color_message(message,varargin)
  % prints color warning message, default is bold orange to warn user
  % kinda like a warning only that it does not throw a warning for matlab
  % and you can also pick all the colors you want!
  % see cprintf for all possible colors
  % here are some examples I stole there:
  % Example:
    %  cprintf;   % displays the demo
    %  cprintf('cyan',   'cyan');
    %  cprintf('_green', 'underlined green');
    %  cprintf(-[1,0,1], 'underlined magenta');
    %  cprintf([1,0.5,0],'and multi-\nline orange\n');
    %  cprintf('*blue',  'and *bold* (R2011b+ only)\n');

  nVarargs = length(varargin);
  if (nVarargs == 0)
    messageColor = '*[0.75, 0.3, 0.0]'; % color defined as rgb string
  elseif (nVarargs == 1)
    messageColor = varargin{1};
  else
    short_warn('Invalid number of input arguments dude!')
    short_warn('Using default color.')
    messageColor = '*[0.75, 0.3, 0.0]'; % color defined as rgb string
  end

  cprintf(messageColor,message);

end
